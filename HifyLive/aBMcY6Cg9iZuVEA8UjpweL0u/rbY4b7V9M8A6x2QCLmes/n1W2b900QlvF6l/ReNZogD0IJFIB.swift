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
        
        // ✅ 这里添加自动高度配置
           tableView.rowHeight = UITableView.automaticDimension
           tableView.estimatedRowHeight = 60

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



        return tableView
    }

    func updateUIView(_ tableView: UITableView, context: Context) {

        let newCount = vm.messages.count
        guard context.coordinator.lastCount != newCount else { return }

        context.coordinator.lastCount = newCount

        tableView.reloadData()

        DispatchQueue.main.async {
            tableView.layoutIfNeeded()
            context.coordinator.scrollToBottom(tableView)
        }

        let inputHeight: CGFloat = 10
        tableView.contentInset.bottom = inputHeight
        tableView.verticalScrollIndicatorInsets.bottom = inputHeight

        if let header = context.coordinator.headerView {
            header.update(info: opponentInfo)
            header.frame.size.height = header.frame.size.height
            tableView.tableHeaderView = header
        }
    }
    
    
    

    // MARK: - Coordinator
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var lastCount: Int = 0
        let parent: ChatTableView
        let keyboardObserver = KeyboardObserver()

        weak var parentTableView: UITableView?
        weak var headerView: ChatProfileHeaderView?

        var cancellables = Set<AnyCancellable>()

        init(_ parent: ChatTableView) {
            self.parent = parent
            super.init()


        }
        func scrollToBottom(_ tableView: UITableView, animated: Bool = false) {
            let count = parent.vm.messages.count
            guard count > 0 else { return }

            let lastRow = count - 1
            let indexPath = IndexPath(row: lastRow, section: 0)

            tableView.scrollToRow(
                at: indexPath,
                at: .bottom,
                animated: animated
            )
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
    private let timeLabel = UILabel()

    private let bubbleContainer = UIView()

    // TEXT
    private let textBubble = UIView()
    private let messageLabel = UILabel()
    private var textGradient: CAGradientLayer?

    // IMAGE
    private let imageBubble = UIView()
    private let contentImageView = UIImageView()

    // MARK: Constraints
    private var avatarLeading: NSLayoutConstraint!
    private var avatarTrailing: NSLayoutConstraint!

    private var bubbleLeading: NSLayoutConstraint!
    private var bubbleTrailing: NSLayoutConstraint!

    private var textBubbleConstraints: [NSLayoutConstraint] = []
    private var imageBubbleConstraints: [NSLayoutConstraint] = []

    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupUI()
        setupConstraints()
        setupGradient()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: UI
    private func setupUI() {

        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)

        timeLabel.font = JqA1kUIFont.font(size: 14, weight: .regular)
        timeLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timeLabel)

        bubbleContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bubbleContainer)

        // TEXT
        textBubble.layer.cornerRadius = 12
        textBubble.clipsToBounds = true
        textBubble.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainer.addSubview(textBubble)

        messageLabel.numberOfLines = 0
        messageLabel.font = JqA1kUIFont.font(size: 14)
        messageLabel.textColor = .white
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        textBubble.addSubview(messageLabel)

        // IMAGE
        imageBubble.layer.cornerRadius = 12
        imageBubble.clipsToBounds = true
        imageBubble.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainer.addSubview(imageBubble)

        contentImageView.contentMode = .scaleAspectFill
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        imageBubble.addSubview(contentImageView)
        
    }
    private func setupGradient() {
        let g = CAGradientLayer()
        g.colors = [
            UIColor(red: 120/255, green: 223/255, blue: 255/255, alpha: 0.32).cgColor,
            UIColor(red: 84/255, green: 105/255, blue: 199/255, alpha: 0.25).cgColor
        ]
        g.startPoint = CGPoint(x: 0, y: 0.5)
        g.endPoint = CGPoint(x: 1, y: 0.5)
        g.cornerRadius = 12
        g.isHidden = true          // 👈 默认隐藏
        textBubble.layer.insertSublayer(g, at: 0)
        textGradient = g
    }

    // MARK: Constraints
    private func setupConstraints() {
        let padding: CGFloat = 8

        avatarLeading = avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        avatarTrailing = avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        avatarLeading.isActive = true

        bubbleLeading = bubbleContainer.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8)
        bubbleTrailing = bubbleContainer.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -8)
        bubbleLeading.isActive = true

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 6),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),

            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            bubbleContainer.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            bubbleContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            bubbleContainer.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.65)
        ])

        // TEXT constraints
        textBubbleConstraints = [
            textBubble.topAnchor.constraint(equalTo: bubbleContainer.topAnchor),
            textBubble.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor),
            textBubble.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor),
            textBubble.trailingAnchor.constraint(equalTo: bubbleContainer.trailingAnchor),

            messageLabel.topAnchor.constraint(equalTo: textBubble.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: textBubble.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: textBubble.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: textBubble.trailingAnchor, constant: -12)
        ]

        // IMAGE constraints
        imageBubbleConstraints = [
            imageBubble.topAnchor.constraint(equalTo: bubbleContainer.topAnchor),
            imageBubble.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor),
            imageBubble.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor),
            imageBubble.trailingAnchor.constraint(equalTo: bubbleContainer.trailingAnchor),

            contentImageView.topAnchor.constraint(equalTo: imageBubble.topAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: imageBubble.bottomAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: imageBubble.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: imageBubble.trailingAnchor),

            // 宽度不要固定，使用 bubbleContainer 宽度
            contentImageView.widthAnchor.constraint(equalTo: bubbleContainer.widthAnchor),
            contentImageView.heightAnchor.constraint(equalTo: contentImageView.widthAnchor, multiplier: 185/245)
        ]
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textGradient?.frame = textBubble.bounds
    }

    // MARK: Configure
    func configure(message: ChatMessage, avatarURL: String?) {

        NSLayoutConstraint.deactivate(textBubbleConstraints)
        NSLayoutConstraint.deactivate(imageBubbleConstraints)

        textBubble.isHidden = true
        imageBubble.isHidden = true

        avatarLeading.isActive = !message.isOutgoingMsg
        avatarTrailing.isActive = message.isOutgoingMsg
        bubbleLeading.isActive = !message.isOutgoingMsg
        bubbleTrailing.isActive = message.isOutgoingMsg

        if let url = avatarURL, let u = URL(string: url) {
            avatarImageView.kf.setImage(with: u)
        }

        timeLabel.isHidden = !message.showTime
        timeLabel.text = message.showTime ? formatTime(message.timestamp) : nil
        bubbleContainer.isHidden = false

        switch message.content {

        case .text(let text):
            textBubble.isHidden = false
            messageLabel.text = text
            NSLayoutConstraint.activate(textBubbleConstraints)

            if message.isOutgoingMsg {
                textGradient?.isHidden = false
                textBubble.backgroundColor = .clear
            } else {
                textGradient?.isHidden = true
                textBubble.backgroundColor = UIColor.white.withAlphaComponent(0.15)
            }

            // 🔥 强制刷新 layout，保证 gradient frame 正确
            setNeedsLayout()
            layoutIfNeeded()
            textGradient?.frame = textBubble.bounds

        case .image(let url, _):
            imageBubble.isHidden = false
            NSLayoutConstraint.activate(imageBubbleConstraints)
            if let url, let u = URL(string: url) {
                contentImageView.kf.setImage(with: u)
            }
        }
    }

    private func formatTime(_ t: TimeInterval) -> String {
        let f = DateFormatter()
        f.dateFormat = "HH:mm"
        return f.string(from: Date(timeIntervalSince1970: t))
    }
}


class KeyboardObserver: NSObject {
    private weak var tableView: UITableView?
    private var inputHeight: CGFloat = 10
    private var lastKeyboardHeight: CGFloat = -1

    func bind(tableView: UITableView, inputHeight: CGFloat = 10) {
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
                tableView.layoutIfNeeded()
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                
                
            }
        })
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


