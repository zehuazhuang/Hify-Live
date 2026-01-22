import SwiftUI
import UIKit
import Combine
import Kingfisher

//聊天list UIKit
struct ChatTableView: UIViewRepresentable {
    let opponentInfo: [String: Any]
    
    @ObservedObject var vm: ChatViewModel
    var keyboardHeight: CGFloat = 0
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITableView {
        
        let tableView = UITableView()
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .interactive
        tableView.register(ChatCell.self, forCellReuseIdentifier: "ChatCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        // 键盘
        context.coordinator.keyboardObserver.bind(tableView: tableView)
        context.coordinator.parentTableView = tableView

        // ✅ 创建 Header（只创建一次）
        let header = ChatProfileHeaderView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 80
            )
        )
        context.coordinator.headerView = header
        tableView.tableHeaderView = header

        // 首次滚动到底部
        DispatchQueue.main.async {
            let count = self.vm.messages.count
            if count > 0 {
                let indexPath = IndexPath(row: count - 1, section: 0)
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
            }
        }

        return tableView
    }

    func updateUIView(_ tableView: UITableView, context: Context) {

        tableView.reloadData()

        let inputHeight: CGFloat = 20
        tableView.contentInset.bottom = inputHeight
        tableView.verticalScrollIndicatorInsets.bottom = inputHeight

        // ✅ 更新 Header 数据
        if let header = context.coordinator.headerView {
            header.update(info: opponentInfo)

            // ⚠️ 关键：高度变化后必须重新 set
            tableView.tableHeaderView = header
        }
    }

    // MARK: - Coordinator
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {

        let parent: ChatTableView
        let keyboardObserver = KeyboardObserver()

        weak var parentTableView: UITableView?
        weak var headerView: ChatProfileHeaderView?

        var cancellables = Set<AnyCancellable>()

        init(_ parent: ChatTableView) {
            self.parent = parent
            super.init()

            // 消息变化 → 自动滚到底部
            parent.vm.$messages
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    guard let self,
                          let tableView = self.parentTableView else { return }

                    let count = self.parent.vm.messages.count
                    guard count > 0 else { return }

                    let lastRow = count - 1
                    if lastRow < tableView.numberOfRows(inSection: 0) {
                        tableView.scrollToRow(
                            at: IndexPath(row: lastRow, section: 0),
                            at: .bottom,
                            animated: true
                        )
                    }
                }
                .store(in: &cancellables)
        }

        // MARK: TableView
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            parent.vm.messages.count
        }

        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChatCell",
                for: indexPath
            ) as! ChatCell

            let msg = parent.vm.messages[indexPath.row]
            cell.configure(message: msg, avatarURL: msg.avatarURL)

            return cell
        }
    }
}


// MARK: - ChatCell
class ChatCell: UITableViewCell {

    // MARK: UI
    private let avatarImageView = UIImageView()
    private let bubble = UIView()
    private let messageLabel = UILabel()
    private let timeLabel = UILabel()
    
    private let contentImageView = UIImageView()//发送图片

    // 渐变（仅 outgoing）
    private let gradientLayer = CAGradientLayer()

    // MARK: Constraints
    private var avatarLeading: NSLayoutConstraint!
    private var avatarTrailing: NSLayoutConstraint!
    private var bubbleLeading: NSLayoutConstraint!
    private var bubbleTrailing: NSLayoutConstraint!

    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear

        setupUI()
        setupConstraints()
        setupGradient()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UI Setup
    private func setupUI() {

        // Avatar
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)
        
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.layer.cornerRadius = 10
        contentImageView.clipsToBounds = true
        contentImageView.contentMode = .scaleAspectFill
        bubble.addSubview(contentImageView)
        
        // Time (系统提示)
        timeLabel.font = JqA1kUIFont.font(size: 14, weight: .regular)
        timeLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.isHidden = true
        contentView.addSubview(timeLabel)
        

        // Bubble
        bubble.layer.cornerRadius = 12
        bubble.clipsToBounds = true
        bubble.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bubble)
        
        // Message
        messageLabel.numberOfLines = 0
        messageLabel.font = JqA1kUIFont.font(size: 14, weight: .regular)
        messageLabel.textColor = .white
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubble.addSubview(messageLabel)


    }

    // MARK: Constraints
    private func setupConstraints() {
        let padding: CGFloat = 8

        // Avatar
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),
        ])
        avatarLeading = avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        avatarTrailing = avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        avatarLeading.isActive = true // 默认 incoming

        // Time label（整屏居中，位于顶部）
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        // Bubble
        bubbleLeading = bubble.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8)
        bubbleTrailing = bubble.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -8)

        bubbleLeading.isActive = true // 默认 incoming
        
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: bubble.topAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: bubble.bottomAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: bubble.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: bubble.trailingAnchor),
        ])


        NSLayoutConstraint.activate([
            bubble.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 6), // 气泡在时间下方
            bubble.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.65),
            bubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])

        // Message inside bubble
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: bubble.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: bubble.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: bubble.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: bubble.trailingAnchor, constant: -12)
        ])

        // Avatar纵向对齐气泡顶部
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: bubble.topAnchor)
        ])
    }

    // MARK: Gradient
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(
                red: 120/255,
                green: 223/255,
                blue: 255/255,
                alpha: 0.32
            ).cgColor,
            UIColor(
                red: 84/255,
                green: 105/255,
                blue: 199/255,
                alpha: 0.25
            ).cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 12

        bubble.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bubble.bounds
    }

    // MARK: Configure
    func configure(message: ChatMessage, avatarURL: String?) {

        messageLabel.isHidden = true
           contentImageView.isHidden = true

           switch message.content {
           case .text(let text):
               messageLabel.text = text
               messageLabel.isHidden = false

           case .image(let url, let size):
               contentImageView.isHidden = false
               if let url, let u = URL(string: url) {
                   contentImageView.kf.setImage(with: u)
               }
           }

        // 时间（大于 5 分钟才显示）
        timeLabel.isHidden = !message.showTime
        timeLabel.text = message.showTime ? formatTime(message.timestamp) : nil

        // Avatar
        if let urlString = avatarURL, let url = URL(string: urlString) {
            avatarImageView.kf.setImage(with: url)
        } else {
            avatarImageView.image = UIImage(named: "avatar_placeholder")
        }

        // Reset constraints
        avatarLeading.isActive = false
        avatarTrailing.isActive = false
        bubbleLeading.isActive = false
        bubbleTrailing.isActive = false

        if message.isOutgoingMsg {
            avatarTrailing.isActive = true
            bubbleTrailing.isActive = true

            gradientLayer.isHidden = false
            bubble.backgroundColor = .clear

        } else {
            avatarLeading.isActive = true
            bubbleLeading.isActive = true

            gradientLayer.isHidden = true
            bubble.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        }
    }

    // MARK: Time format
    private func formatTime(_ timestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}


class KeyboardObserver: NSObject {
    private weak var tableView: UITableView?
    private var inputHeight: CGFloat = 20
    private var lastKeyboardHeight: CGFloat = -1

    func bind(tableView: UITableView, inputHeight: CGFloat = 20) {
        self.tableView = tableView
        self.inputHeight = inputHeight

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChangeFrame(_:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    @objc private func keyboardWillChangeFrame(_ notif: Notification) {
        guard let tableView = tableView,
              let frameEnd = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = notif.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
              let curve = notif.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }

        let keyboardHeight = max(0, UIScreen.main.bounds.height - frameEnd.origin.y)
        if keyboardHeight == lastKeyboardHeight { return }
        lastKeyboardHeight = keyboardHeight

        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: UIView.AnimationOptions(rawValue: curve << 16),
                       animations: {
            tableView.contentInset.bottom = self.inputHeight + keyboardHeight
            tableView.verticalScrollIndicatorInsets.bottom = self.inputHeight + keyboardHeight

            // ⚡ animated: true 跟随键盘动画平滑滚动
            if tableView.numberOfRows(inSection: 0) > 0 {
                let lastRow = tableView.numberOfRows(inSection: 0) - 1
                let indexPath = IndexPath(row: lastRow, section: 0)
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        })
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


