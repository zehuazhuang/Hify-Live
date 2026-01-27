import UIKit
import NIMSDK
class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,NIMChatroomManagerDelegate,
                          NIMChatManagerDelegate {
    
    var yxRoomId: String!
    var userId: Int! //主播id
    
    private var messages: [PublicMessage] = []
    private var tableView: UITableView!
    private var messageTextField: UITextField!
    
    private var chatContainer: UIView!  // 包含 tableView + inputContainer
    private var inputContainer: UIView!
    private var inputBarBottomConstraint: NSLayoutConstraint!
    private let chatHeight: CGFloat = 300
    private var hasJoinedChannel = false
    private var isMuted = false // 保存静音状态
    
    let extraButton1 = UIButton(type: .custom)
    
    var onMuteTappedCallback: ((UInt, Bool) -> Void)?
    
    private var didInitialJoin = false
    
    //private var didApplyMask = false
    private var chatContainerBottomConstraint: NSLayoutConstraint!
    private let chatContainerHeight: CGFloat = 300
    
    private var topFadeView: UIView!
    private let fadeMaskLayer = CAGradientLayer()
    private let fadeMaskContainer = CALayer()
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        
       
        
        setupViews()
        setupKeyboardObservers()
        setupTapGesture()
       
    }
    
    deinit {
   
    }
    
    private func setupTopFadeMask() {
        let maskLayer = CAGradientLayer()
            maskLayer.frame = chatContainer.bounds // 关键：mask 放在容器上
            maskLayer.colors = [
                UIColor.clear.cgColor,               // 顶部透明
                UIColor.black.cgColor                // 底部完全显示
            ]
            maskLayer.locations = [0.0, 0.5]        // 顶部 10% 渐变
            maskLayer.startPoint = CGPoint(x: 0, y: 0)
            maskLayer.endPoint = CGPoint(x: 0, y: 1)
            
            chatContainer.layer.mask = maskLayer
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        // mask 位置随 scrollView.contentOffset.y 动
        var frame = fadeMaskLayer.frame
        frame.origin.y = scrollView.contentOffset.y
        fadeMaskLayer.frame = frame
        
        CATransaction.commit()
    }

    
    //渐变隐藏
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let maskLayer = chatContainer.layer.mask as? CAGradientLayer {
            maskLayer.frame = chatContainer.bounds
        }
    }

    
  
    

    
    //静音方法
    @objc private func onMuteTapped() {
            isMuted.toggle()
            if let uid = userId {
                onMuteTappedCallback?(UInt(uid), isMuted)
            }
            let iconName = isMuted ? "xuiasdjing" : "ahdiqwYuj"
            extraButton1.setImage(UIImage(named: iconName), for: .normal)
            print(isMuted ? "🔇 已静音主播" : "🔊 已取消静音")
        }
    
    // MARK: - UI Setup
    private func setupViews() {

        // chatContainer 包含 tableView + inputContainer
        chatContainer = UIView()
        chatContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatContainer)
        
        // 现在 chatContainer 已经存在，可以创建底部约束
        chatContainerBottomConstraint = chatContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        chatContainerBottomConstraint.isActive = true

        NSLayoutConstraint.activate([
            chatContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatContainer.heightAnchor.constraint(equalToConstant: chatContainerHeight)
        ])

  
        
        // TableView
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        
        chatContainer.addSubview(tableView)
        
        
        setupTopFadeMask()
        
        // 输入框 + 按钮容器
        inputContainer = UIView()
        inputContainer.translatesAutoresizingMaskIntoConstraints = false
        chatContainer.addSubview(inputContainer)
        
        // TextField
        messageTextField = UITextField()
        messageTextField.textColor = UIColor.white
        messageTextField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        messageTextField.font = JqA1kUIFont.font(size: 14, weight: .regular)
        messageTextField.layer.cornerRadius = 46/2
        messageTextField.attributedPlaceholder = NSAttributedString(
            string: "Say Hi",
            attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.6)]
        )
        messageTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 46))
        messageTextField.leftViewMode = .always
        messageTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 46))
        messageTextField.rightViewMode = .always
        messageTextField.returnKeyType = .send
        messageTextField.delegate = self
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // 静音按钮
        extraButton1.setImage(UIImage(named: "ahdiqwYuj"), for: .normal)
        extraButton1.translatesAutoresizingMaskIntoConstraints = false
        extraButton1.imageView?.contentMode = .scaleAspectFit
        extraButton1.addTarget(self, action: #selector(onMuteTapped), for: .touchUpInside)
        
        // 水平堆叠
        let stack = UIStackView(arrangedSubviews: [messageTextField, extraButton1])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        inputContainer.addSubview(stack)
        
        // 输入栏底部约束
        inputBarBottomConstraint = inputContainer.bottomAnchor.constraint(equalTo: chatContainer.bottomAnchor)
        inputBarBottomConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            // tableView
            tableView.topAnchor.constraint(equalTo: chatContainer.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: chatContainer.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: chatContainer.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: inputContainer.topAnchor, constant: -8),
            
            // inputContainer 高度 & 水平
            inputContainer.leadingAnchor.constraint(equalTo: chatContainer.leadingAnchor, constant: 16),
            inputContainer.trailingAnchor.constraint(equalTo: chatContainer.trailingAnchor, constant: -16),
            inputContainer.heightAnchor.constraint(equalToConstant: 46),
            
            // stack 填满 inputContainer
            stack.topAnchor.constraint(equalTo: inputContainer.topAnchor),
            stack.bottomAnchor.constraint(equalTo: inputContainer.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor),
            
            // 按钮固定宽高
            extraButton1.widthAnchor.constraint(equalToConstant: 46),
            extraButton1.heightAnchor.constraint(equalToConstant: 46)
        ])
    }

    

    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Keyboard
    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        // 键盘高度减去安全区域
        let keyboardHeight = keyboardFrame.height - view.safeAreaInsets.bottom
        chatContainerBottomConstraint.constant = -keyboardHeight-10

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
       
    }

    @objc private func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        chatContainerBottomConstraint.constant = 0

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    // MARK: - Send Message
    @objc private func onSendTapped() {
        guard let text = messageTextField.text, !text.isEmpty else { return }
        dismissKeyboard()
        
        let user = IyfdHMdY.bTa3L6BoprG
        let msg = PublicMessage(
            avatarURL: user.iBmPfFGfxu5JV7Aii7.string("icon"),
            nickname: user.iBmPfFGfxu5JV7Aii7.string("nickname"),
            text: text,
            isMine: true
        )
        appendMessage(msg)
        messageTextField.text = ""
        
        // 发送消息到聊天室
        sendMessage(text)
    }

    
    func appendMessage(_ msg: PublicMessage) {
        messages.append(msg)
        let newIndexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.performBatchUpdates({
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }, completion: { _ in
            self.scrollToBottom(animated: true)
        })
    }
    
    private func scrollToBottom(animated: Bool) {
        guard messages.count > 0 else { return }
        let lastIndex = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: lastIndex, at: .bottom, animated: animated)
    }

    
 
    
    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "PublicMessageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PublicMessageCell ??
                   PublicMessageCell(style: .default, reuseIdentifier: cellId)
        cell.configure(with: messages[indexPath.row])
        return cell
    }

    // 占位 header，用于消息少时推到底
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let contentHeight = messages.reduce(0) { $0 + estimatedHeight(for: $1) } + CGFloat(messages.count - 1) * 8
        let availableHeight = tableView.bounds.height - inputContainer.frame.height
        let headerHeight = max(0, availableHeight - contentHeight)
        return headerHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .clear
        return header
    }

    // 估算消息高度
    private func estimatedHeight(for message: PublicMessage) -> CGFloat {
        let labelWidth = tableView.bounds.width - 32
        let size = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14)]
        let rect = message.text.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: attributes, context: nil)
        return rect.height + 20
    }
    // MARK: - RTM

    

    //云信
     func joinChatroom() {
        guard let roomId = yxRoomId else { return }
        
        let request = NIMChatroomEnterRequest()
        request.roomId = roomId
        NIMSDK.shared().chatroomManager.enterChatroom(request) { [weak self] error, chatroom, member in
            guard let self = self else { return }
            
            if let error = error {
                print("❌ 加入聊天室失败:", error.localizedDescription)
                return
            }
            
            print("✅ 成功加入聊天室:", chatroom?.roomId ?? "")
            self.hasJoinedChannel = true

            // 注册消息监听
            NIMSDK.shared().chatroomManager.add(self) // 监听聊天室事件
           
        }
    }
    
    private func leaveChatroomIfNeeded() {
        guard hasJoinedChannel, let roomId = yxRoomId else { return }
        NIMSDK.shared().chatroomManager.exitChatroom(roomId) { error in
            print("✅ 离开聊天室:", error == nil ? "成功" : "失败")
        }
        hasJoinedChannel = false
        NIMSDK.shared().chatManager.remove(self) // 取消消息监听
    }
    private func sendMessage(_ text: String) {
        guard let roomId = yxRoomId else { return }

        let message = NIMMessage()
        message.text = text
        let session = NIMSession(roomId, type: .chatroom)

        NIMSDK.shared().chatManager.send(message, to: session) { error in
            if let error = error {
                print("❌ 发送聊天室消息失败:", error)
            } else {
                print("✅ 发送聊天室消息成功")
            }
        }
    }
    //云信end
    

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        leaveChatroomIfNeeded()
    }
}
extension ChatViewController {
    func onRecvMessages(_ messages: [NIMMessage]) {
        for msg in messages {
            // 安全解包 session
            guard let session = msg.session, session.sessionType == .chatroom else { continue }

            let publicMsg = PublicMessage(
                avatarURL: nil,
                nickname: msg.from ?? "Unknown",
                text: msg.text ?? "",
                isMine: msg.from == "\(userId ?? 0)"
            )

            DispatchQueue.main.async {
                self.appendMessage(publicMsg)
            }
        }
    }
}
