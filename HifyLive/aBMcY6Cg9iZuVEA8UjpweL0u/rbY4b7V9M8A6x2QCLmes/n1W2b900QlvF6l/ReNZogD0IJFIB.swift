import SwiftUI
import UIPilot
import UIKit
import Combine
import Kingfisher
import NIMSDK

//聊天list UIKit
struct ChatTableView: UIViewRepresentable {
    let opponentInfo: [String: Any]
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @ObservedObject var vm: ChatViewModel
    var keyboardHeight: CGFloat = 0
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    let onAvatarTap: (Int) -> Void
    
   
    
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
        header.update(info: opponentInfo)
        
        header.onAvatarTap = { uid in
            context.coordinator.parent.onAvatarTap(uid)
        }
        
        header.onImageTap = { pics, startIndex in
            pilot.push(
                .ZQ9FPreviewWrapper(
                    pics: pics,
                    startIndex: startIndex
                )
            )
        }
        
        // 🔥 只在这里设置一次
        tableView.tableHeaderView = header
        context.coordinator.headerView = header



        return tableView
    }

    func updateUIView(_ tableView: UITableView, context: Context) {
        let count = vm.messages.count
        let lastCount = context.coordinator.lastCount

        // 数据被重置或者第一次加载，直接 reload
        if lastCount > count || lastCount == 0 {
            tableView.reloadData()
            context.coordinator.lastCount = count
            DispatchQueue.main.async {
                context.coordinator.scrollToBottom(tableView, animated: !context.coordinator.firstLoad)
                context.coordinator.firstLoad = false
            }
        } else if count > lastCount {
            // 只有 append 新消息时才插入行
            let newIndexPaths = (lastCount..<count).map { IndexPath(row: $0, section: 0) }
            tableView.performBatchUpdates({
                tableView.insertRows(at: newIndexPaths, with: .none)
            }, completion: { _ in
                context.coordinator.scrollToBottom(tableView, animated: !context.coordinator.firstLoad)
                context.coordinator.firstLoad = false
            })
            context.coordinator.lastCount = count
        }
//        else {
//            
//            
//            tableView.reloadData()
//        }

        // 键盘底部 inset
        let inputHeight: CGFloat = 20
        tableView.contentInset.bottom = inputHeight
        tableView.verticalScrollIndicatorInsets.bottom = inputHeight

        // 更新 header 高度
        if let header = context.coordinator.headerView {
            let last = context.coordinator.lastOpponentInfo
            let current = opponentInfo

            // 比较关键字段，避免每次都刷新
            let lastId = last?["userId"] as? Int
            let currentId = current["userId"] as? Int



            if lastId != currentId  {
                context.coordinator.lastOpponentInfo = current
                header.update(info: current)
            }

                let newHeight = header.frame.height
                let oldHeight = context.coordinator.lastHeaderHeight

                // ✅ 只有高度真的变了，才动 tableHeaderView
                if newHeight != oldHeight {
                    context.coordinator.lastHeaderHeight = newHeight

                    DispatchQueue.main.async {
                        UIView.performWithoutAnimation {
                            tableView.tableHeaderView = header
                        }
                        context.coordinator.scrollToBottom(tableView, animated: false)
                    }
                }
            }
    }

    
    
    

    // MARK: - Coordinator
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var lastCount: Int = 0
        var firstLoad: Bool = true
        let parent: ChatTableView
        let keyboardObserver = KeyboardObserver()
        
        var lastHeaderHeight: CGFloat = 0
        var lastOpponentInfo: [String: Any]? = nil

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
               tableView.scrollToRow(at: indexPath, at: .bottom, animated: animated)
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
            
            cell.onResendTap = { [weak self] message in
                Task {
                    await self?.parent.vm.resendMessage(message)
                }
            }
            
            cell.onImageTap = { [weak self] imageURL in
                guard let self else { return }



                parent.pilot.push(
                        .ZQ9FPreviewWrapper(
                            pics: [imageURL],
                            startIndex: 0
                        )
                    )
            }
            //头像跳转
            cell.onAvatarTap = { [weak self] in
                guard let self else { return }
                
                let msg = self.parent.vm.messages[indexPath.row]
                
                
                
                
                
                if msg.isOutgoingMsg {
                    self.parent.onAvatarTap(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId"))
                } else {
                    guard
                        let info = self.lastOpponentInfo,
                        let uid = info["userId"] as? Int
                    else {
                        
                        return
                    }
                    
                    self.parent.onAvatarTap(uid)
                }
                   
            }
            
            parent.vm.onMessageUpdated = {
                tableView.reloadData()
            }

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
    private let textBubble = GradientBubbleView()
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
    
    
    // MARK: - Gift
    private let giftBubble = UIView()
    private let giftImageView = UIImageView()
    private let giftCountLabel = UILabel()

    private var giftBubbleConstraints: [NSLayoutConstraint] = []
    private let giftBorder = GradientBorderView(borderWidth: 1)
    private let giftTitleLabel = UILabel()
    private let giftIconView = UIImageView()

    private let giftHStack = UIStackView()
    private let giftVStack = UIStackView()
    
    var onAvatarTap: (() -> Void)? //点击头像
    
    
    var onResendTap: ((ChatMessage) -> Void)?
    var currentMessage: ChatMessage?
    
    //拉黑label
    private let blockHintLabel: UILabel = {
        let label = UILabel()
        label.font = JqA1kUIFont.font(size: 14, weight: .regular)              // 关键：同样式
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var bubbleBottomConstraint: NSLayoutConstraint!
    private var blockHintBottomConstraint: NSLayoutConstraint!
    var onImageTap: ((String) -> Void)? //图片点击回调
   
    
    //放大图片url
    private var currentImageURL: String?
    
    
    //发送状态
    private let statusIcon = UIImageView()
    private let sendingIndicator = UIActivityIndicatorView(style: .medium)
    private var cancellables = Set<AnyCancellable>()
    
    //当前发送状态
    private var currentSendStatus: SendStatus?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cancellables.removeAll()
        sendingIndicator.stopAnimating()
        statusIcon.isHidden = true
    }
    
    // 🔑 写在这里
    private func updateSendStatus(_ status: SendStatus, isOutgoing: Bool) {
        statusIcon.isHidden = true
        sendingIndicator.stopAnimating()

        guard isOutgoing else { return }

        switch status {
        case .sending:
            sendingIndicator.startAnimating()

        case .success:
            break

            case .failed(let reason):
                statusIcon.isHidden = false
                statusIcon.tintColor = .red

                switch reason {
                case .network:
                    statusIcon.image = UIImage(systemName: "exclamationmark.circle.fill")
                case .sensitive:
                    statusIcon.image = UIImage(systemName: "exclamationmark.triangle.fill")
                case .unknown:
                    statusIcon.image = UIImage(systemName: "exclamationmark.circle")
                case .wTiahblock:
                    statusIcon.image = UIImage(named: "jtIX8vefgtZLPffo7uoIGDDyg3sfmpju")
                    
                }
            }
        
        currentSendStatus = status
        }
    
    @objc private func statusIconTapped() {
        guard case .failed(let reason)? = currentSendStatus,
              reason == .wTiahblock else { return }

        // 只处理 wTiahblock
        print("点击拉黑icon")
        guard let vc = parentViewController else { return }

        let alertView = Vvk0RGWUsPkMw(
            onCancel: {
                vc.dismiss(animated: true)
            },
            onConfirm: { [weak self] in
                vc.dismiss(animated: true)
                guard let message = self?.currentMessage else { return }
                self?.onResendTap?(message)
            }
        )

          let hosting = UIHostingController(rootView: alertView)
        hosting.modalPresentationStyle = .overFullScreen
        hosting.modalTransitionStyle = .crossDissolve   // 关键！
        hosting.view.backgroundColor = .clear           // 重要
          vc.present(hosting, animated: true)
    }
    
    @objc private func handleAvatarTap() {
        onAvatarTap?()
    }
    
    //图片点击放大
    @objc private func handleImageTap() {
            guard let imageURL = currentImageURL else { return }
            onImageTap?(imageURL)
        }
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupUI()
        setupConstraints()
      //  setupGradient()
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: UI
    private func setupUI() {
        //发送状态
        statusIcon.image = UIImage(systemName: "exclamationmark.circle.fill")
        statusIcon.tintColor = .red
        statusIcon.contentMode = .scaleAspectFit
        statusIcon.translatesAutoresizingMaskIntoConstraints = false
        statusIcon.isHidden = true
        statusIcon.isUserInteractionEnabled = true
        let tcm87KJtap = UITapGestureRecognizer(
            target: self,
            action: #selector(statusIconTapped)
        )
        statusIcon.addGestureRecognizer(tcm87KJtap)
        contentView.addSubview(statusIcon)



        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true

        let avatarTap = UITapGestureRecognizer(
            target: self,
            action: #selector(handleAvatarTap)
        )
        avatarImageView.addGestureRecognizer(avatarTap)
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
        
        
        
        // Gift bubble
        giftBubble.layer.cornerRadius = 12
        giftBubble.clipsToBounds = true
        giftBubble.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        giftBubble.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainer.addSubview(giftBubble)
        
        // 添加渐变边框
        giftBorder.layer.cornerRadius = 12
        giftBorder.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainer.addSubview(giftBorder)
        bubbleContainer.bringSubviewToFront(giftBubble) // 确保内容在上层

        // gift image
        giftImageView.contentMode = .scaleAspectFit
        giftImageView.translatesAutoresizingMaskIntoConstraints = false
        giftBubble.addSubview(giftImageView)
        
        //gift label
        giftTitleLabel.font = JqA1kUIFont.font(size: 14, weight: .medium)
        giftTitleLabel.textColor = UIColor.white
        giftTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // gift count
        giftCountLabel.font = JqA1kUIFont.font(size: 20, weight: .black)
        giftCountLabel.textColor = .white
        giftCountLabel.transform = CGAffineTransform(rotationAngle: .pi / 30)
        giftCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // gift icon
        giftIconView.contentMode = .scaleAspectFit
        giftIconView.image = UIImage(named: "ulzb7LfsuPK")
        giftIconView.translatesAutoresizingMaskIntoConstraints = false
        giftIconView.transform = CGAffineTransform(translationX: 0, y: 5)
        
        // HStack
        giftHStack.axis = .horizontal
        giftHStack.alignment = .center
        giftHStack.spacing = 4
        giftHStack.translatesAutoresizingMaskIntoConstraints = false

        giftHStack.addArrangedSubview(giftIconView)
        giftHStack.addArrangedSubview(giftCountLabel)

        // VStack
        giftVStack.axis = .vertical
        giftVStack.alignment = .leading
        giftVStack.spacing = 4
        giftVStack.translatesAutoresizingMaskIntoConstraints = false

        giftVStack.addArrangedSubview(giftTitleLabel)
        giftVStack.addArrangedSubview(giftHStack)

        // 加入 bubble
        giftBubble.addSubview(giftVStack)
        
        
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleImageTap))
        contentImageView.addGestureRecognizer(tap)
        imageBubble.addSubview(contentImageView)
        
        //发送状态
        sendingIndicator.color = .white
        sendingIndicator.translatesAutoresizingMaskIntoConstraints = false
        sendingIndicator.hidesWhenStopped = true
        bubbleContainer.addSubview(sendingIndicator)
        
        contentView.addSubview(blockHintLabel)
        
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
        
        // 放在气泡右下角
        NSLayoutConstraint.activate([
            statusIcon.widthAnchor.constraint(equalToConstant: 16),
            statusIcon.heightAnchor.constraint(equalToConstant: 16),
            statusIcon.trailingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor, constant: -6),
            statusIcon.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            // 时间标签
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // 头像
            avatarImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 12),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),

            // 气泡
            bubbleContainer.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
         //   bubbleContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            bubbleContainer.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.65),
            //发送状态
          
            sendingIndicator.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor, constant: -26), // 左边距离
                sendingIndicator.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor, constant: -4),   // 底部距离
            
     
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
            contentImageView.widthAnchor.constraint(equalToConstant: 245),
            contentImageView.heightAnchor.constraint(equalToConstant: 185)
        ]
        
        //gift
        giftBubbleConstraints = [

            giftBubble.topAnchor.constraint(equalTo: bubbleContainer.topAnchor),
            giftBubble.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor),
            giftBubble.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor),
            giftBubble.trailingAnchor.constraint(equalTo: bubbleContainer.trailingAnchor),
            giftBubble.heightAnchor.constraint(equalToConstant: 96),
            
            giftBorder.topAnchor.constraint(equalTo: bubbleContainer.topAnchor),
               giftBorder.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor),
               giftBorder.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor),
               giftBorder.trailingAnchor.constraint(equalTo: bubbleContainer.trailingAnchor),

            giftImageView.leadingAnchor.constraint(equalTo: giftBubble.leadingAnchor, constant: 16),
            giftImageView.centerYAnchor.constraint(equalTo: giftBubble.centerYAnchor),
            giftImageView.widthAnchor.constraint(equalToConstant: 72),
            giftImageView.heightAnchor.constraint(equalToConstant: 72),

            giftVStack.leadingAnchor.constraint(equalTo: giftImageView.trailingAnchor, constant: 12),
               giftVStack.trailingAnchor.constraint(equalTo: giftBubble.trailingAnchor, constant: -16),
               giftVStack.centerYAnchor.constraint(equalTo: giftBubble.centerYAnchor),

               giftIconView.widthAnchor.constraint(equalToConstant: 14),
               giftIconView.heightAnchor.constraint(equalToConstant: 14)
        ]
        
        //拉黑
        NSLayoutConstraint.activate([
            blockHintLabel.topAnchor.constraint(
                equalTo: bubbleContainer.bottomAnchor,
                constant: 6
            ),
            blockHintLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 40
            ),
            blockHintLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -40
            ),

        ])
        
        bubbleBottomConstraint = bubbleContainer.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -padding
        )

        blockHintBottomConstraint = blockHintLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -6
        )

        // 默认：没拉黑 → bubble 贴底
        bubbleBottomConstraint.isActive = true
        blockHintBottomConstraint.isActive = false
        blockHintLabel.isHidden = true
    }


    // MARK: Configure
    func configure(message: ChatMessage, avatarURL: String?) {
        
        self.currentMessage = message
        
        // ⚠️ 先清掉旧订阅
          cancellables.removeAll()

          // 👉 先按当前状态画一遍
          updateSendStatus(message.sendStatus, isOutgoing: message.isOutgoingMsg)

          // ✅ 监听后续状态变化（只改 icon）
          message.$sendStatus
              .receive(on: DispatchQueue.main)
              .sink { [weak self] status in
                  guard let self else { return }
                  self.updateSendStatus(status, isOutgoing: message.isOutgoingMsg)
              }
              .store(in: &cancellables)

        NSLayoutConstraint.deactivate(textBubbleConstraints)
        NSLayoutConstraint.deactivate(imageBubbleConstraints)

        textBubble.isHidden = true
        imageBubble.isHidden = true
        giftBubble.isHidden = true
        NSLayoutConstraint.deactivate(giftBubbleConstraints)

        // 布局方向
        avatarLeading.isActive = !message.isOutgoingMsg
        avatarTrailing.isActive = message.isOutgoingMsg
        bubbleLeading.isActive = !message.isOutgoingMsg
        bubbleTrailing.isActive = message.isOutgoingMsg

        // 头像
        if let url = avatarURL, let u = URL(string: url) {
            avatarImageView.kf.setImage(with: u)
        }

        // 时间显示
        timeLabel.isHidden = !message.showTime
        timeLabel.text = message.showTime ? Date(timeIntervalSince1970: message.timestamp).oQBlX821fcQ() : nil
        bubbleContainer.isHidden = false
        
        //拉黑
        let isBlocked: Bool = {
            if case .failed(reason: .wTiahblock) = message.sendStatus {
                return true
            }
            return false
        }()

        blockHintLabel.isHidden = !isBlocked
        blockHintLabel.text = isBlocked ? "The message has been sent, but was \nrejected by the recipient." : nil

        // 🔥 核心：谁显示，谁当底
        bubbleBottomConstraint.isActive = !isBlocked
        blockHintBottomConstraint.isActive = isBlocked

        switch message.content {
        case .text(let text):
            textBubble.isHidden = false
            messageLabel.text = text
            NSLayoutConstraint.activate(textBubbleConstraints)

            textBubble.backgroundColor = message.isOutgoingMsg
                ? .clear   // gradient 已经在 layer 上
                : UIColor.white.withAlphaComponent(0.15)
            
            // 设置气泡直角
                textBubble.cornerStyle = message.isOutgoingMsg ? .rightTopStraight : .leftTopStraight

        case .image(let url, _):
            imageBubble.isHidden = false
            NSLayoutConstraint.activate(imageBubbleConstraints)
            
            currentImageURL = url

            // 先清空旧图片
            contentImageView.image = nil

            if let localImage = message.localImage {
                contentImageView.image = localImage
            } else if let url, let u = URL(string: url) {
                contentImageView.kf.setImage(
                    with: u,
                    placeholder: UIImage(systemName: "photo"),
                    options: [.transition(.fade(0.25))]
                ) { [weak self] result in
                    switch result {
                    case .success(_):
                        break  // 通常不需要额外刷新布局
                    case .failure(_):
                        self?.contentImageView.image = UIImage(systemName: "photo")
                    }
                }
            } else {
                contentImageView.image = UIImage(systemName: "photo")
            }
        case .gift(let gift):
            giftBubble.isHidden = false
            NSLayoutConstraint.activate(giftBubbleConstraints)
            let text = "\(gift.giftNum)"
            let attr = NSAttributedString(
                string: text,
                attributes: [
                    .font: JqA1kUIFont.font(size: 32, weight: .black),
                    .foregroundColor:  UIColor(red: 255/255, green: 55/255, blue: 28/255, alpha: 1),        // 字体颜色
                    .strokeColor: UIColor.white,
                    .strokeWidth: -3.0,
                    
                ]
            )
            giftCountLabel.attributedText = attr

            if let url = URL(string: gift.giftIcon) {
                giftImageView.kf.setImage(
                    with: url,
                    placeholder: UIImage(systemName: "gift")
                )
            }
            giftTitleLabel.text = message.isOutgoingMsg ? "Send Gift" : "Gift Received"
        }

        // ✅ 显示发送状态

        updateSendStatus(message.sendStatus, isOutgoing: message.isOutgoingMsg)
    }



    private func formatTime(_ t: TimeInterval) -> String {
        let f = DateFormatter()
        f.dateFormat = "HH:mm"
        return f.string(from: Date(timeIntervalSince1970: t))
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
                tableView.layoutIfNeeded()
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                
                
            }
        })
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//渐变气泡
final class GradientBubbleView: UIView {

    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    // 新增属性：设置哪个角是直角
    enum BubbleCornerStyle {
        case leftTopStraight
        case rightTopStraight
        case allRounded
    }

    var cornerStyle: BubbleCornerStyle = .allRounded {
        didSet { updateCorners() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer.masksToBounds = true
        layer.cornerRadius = 12

        gradientLayer.colors = [
            UIColor(red: 120/255, green: 223/255, blue: 255/255, alpha: 0.32).cgColor,
            UIColor(red: 84/255, green: 105/255, blue: 199/255, alpha: 0.25).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }

    private func updateCorners() {
        layer.cornerRadius = 12
        layer.maskedCorners = []

        switch cornerStyle {
        case .allRounded:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,
                                   .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .leftTopStraight:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .rightTopStraight:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
}
//渐变边框
final class GradientBorderView: UIView {
    private let borderWidth: CGFloat
    private let gradientLayer = CAGradientLayer()
    private let shapeLayer = CAShapeLayer()

    init(borderWidth: CGFloat = 2) {
        self.borderWidth = borderWidth
        super.init(frame: .zero)
        setupGradient()
    }

    required init?(coder: NSCoder) {
        self.borderWidth = 2
        super.init(coder: coder)
        setupGradient()
    }

    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 17/255, green: 226/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 217/255, green: 28/255, blue: 255/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradientLayer)

        gradientLayer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = borderWidth
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        let path = UIBezierPath(
            roundedRect: bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2),
            cornerRadius: layer.cornerRadius
        )
        shapeLayer.path = path.cgPath
    }
}


extension UIView {
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let r = responder {
            if let vc = r as? UIViewController {
                return vc
            }
            responder = r.next
        }
        return nil
    }
}
