import SwiftUI
import UIKit
import Combine
import Kingfisher

//聊天list UIKit
struct ChatTableView: UIViewRepresentable {
    @ObservedObject var vm: ChatViewModel
    var keyboardHeight: CGFloat = 0 // ✅ 新增

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
        
        // 绑定键盘监听
        context.coordinator.keyboardObserver.bind(tableView: tableView)
        
        // ⚡ 保存 tableView 给 coordinator
        context.coordinator.parentTableView = tableView
        
        // 页面第一次加载滚到底部
        DispatchQueue.main.async {
            let count = self.vm.messages.count
            if count > 0 {
                let indexPath = IndexPath(row: count - 1, section: 0)
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
            }
        }
        
        return tableView
    }

    func updateUIView(_ uiView: UITableView, context: Context) {
        // ⚡ 只 reloadData，不滚动
        uiView.reloadData()
        let inputHeight: CGFloat = 56
        uiView.contentInset.bottom = inputHeight
        uiView.verticalScrollIndicatorInsets.bottom = inputHeight
    }

    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: ChatTableView
        var myAvatarURL: String
        let keyboardObserver = KeyboardObserver()
        weak var parentTableView: UITableView?
        var cancellables = Set<AnyCancellable>()

        init(_ parent: ChatTableView) {
            self.parent = parent
            self.myAvatarURL = IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7["icon"] as? String ?? ""
            super.init()

            // 监听 messages 变化，自动滚到底部
            parent.vm.$messages
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    guard let self = self,
                          let tableView = self.parentTableView else { return }
                    let count = self.parent.vm.messages.count
                    guard count > 0 else { return }

                    DispatchQueue.main.async {
                        let lastRow = count - 1
                        // ✅ 确保不会越界
                        if lastRow < tableView.numberOfRows(inSection: 0) {
                            let indexPath = IndexPath(row: lastRow, section: 0)
                            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                        }
                    }
                }
                .store(in: &cancellables)
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.vm.messages.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
            let msg = parent.vm.messages[indexPath.row]

            let avatarURL: String?
            if msg.isOutgoingMsg {
                avatarURL = IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7["icon"] as? String ?? ""
            } else {
                avatarURL = IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7["icon"] as? String ?? ""
            }

            cell.configure(message: msg, avatarURL: avatarURL)
            return cell
        }
    }
}




class ChatCell: UITableViewCell {
    
    private let bubble = UIView()
    private let messageLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let timeLabel = UILabel()
    
    private var isOutgoing = false
    
    private var bubbleLeadingConstraint: NSLayoutConstraint!
    private var bubbleTrailingConstraint: NSLayoutConstraint!
    private var avatarLeadingConstraint: NSLayoutConstraint!
    private var avatarTrailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        // Avatar
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        contentView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Bubble
        bubble.layer.cornerRadius = 12
        bubble.clipsToBounds = true
        contentView.addSubview(bubble)
        bubble.translatesAutoresizingMaskIntoConstraints = false
        
        // Message label
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 14)
        bubble.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Time label
        timeLabel.font = .systemFont(ofSize: 12)
        timeLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        timeLabel.textAlignment = .center
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupConstraints() {
        let padding: CGFloat = 16
        
        // Avatar constraints (width/height fixed)
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
        
        avatarLeadingConstraint = avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        avatarTrailingConstraint = avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        
        // Bubble constraints
        bubbleLeadingConstraint = bubble.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8)
        bubbleTrailingConstraint = bubble.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -8)
        
        NSLayoutConstraint.activate([
            bubble.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            bubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            bubbleLeadingConstraint,
            bubbleTrailingConstraint
        ])
        
        // MessageLabel inside bubble
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: bubble.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: bubble.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: bubble.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: bubble.trailingAnchor, constant: -12)
        ])
        
        // Time label below bubble
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: bubble.bottomAnchor, constant: 4),
            timeLabel.centerXAnchor.constraint(equalTo: bubble.centerXAnchor),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -4)
        ])
    }
    
    func configure(message: ChatMessage, avatarURL: String?) {
        isOutgoing = message.isOutgoingMsg

        // 头像
        if let urlString = avatarURL, let url = URL(string: urlString) {
            avatarImageView.kf.setImage(with: url, placeholder: UIImage(named: "avatar_placeholder"))
        } else {
            avatarImageView.image = UIImage(named: "avatar_placeholder")
        }

        messageLabel.text = message.text

        // 先全部 deactivate
        avatarLeadingConstraint.isActive = false
        avatarTrailingConstraint.isActive = false
        bubbleLeadingConstraint.isActive = false
        bubbleTrailingConstraint.isActive = false

        if isOutgoing {
            avatarTrailingConstraint.isActive = true
            bubbleTrailingConstraint.isActive = true
            bubble.backgroundColor = UIColor.clear
            // 可以加渐变
        } else {
            avatarLeadingConstraint.isActive = true
            bubbleLeadingConstraint.isActive = true
            bubble.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        }
    }
}

class KeyboardObserver: NSObject {
    private weak var tableView: UITableView?
    private var inputHeight: CGFloat = 56
    private var lastKeyboardHeight: CGFloat = -1

    func bind(tableView: UITableView, inputHeight: CGFloat = 56) {
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
