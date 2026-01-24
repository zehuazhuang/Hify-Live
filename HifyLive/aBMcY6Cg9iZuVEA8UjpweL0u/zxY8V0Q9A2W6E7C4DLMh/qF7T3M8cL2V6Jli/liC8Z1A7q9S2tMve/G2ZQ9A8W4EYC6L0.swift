import UIKit
import AgoraRtmKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AgoraRtmChannelDelegate {
    
    var yxRoomId: String!
    var userId: String!
    
    private var messages: [PublicMessage] = []
    private var tableView: UITableView!
    private var messageTextField: UITextField!
    private var sendButton: UIButton!
    
    private var inputBarBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        
        setupViews()
        setupKeyboardObservers()
        setupTapGesture()
        joinRTMChannel()
    }
    
    // MARK: - UI Setup
    private func setupViews() {
        // TableView
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1) // 翻转
        view.addSubview(tableView)
        
        // 输入栏
        messageTextField = UITextField()
        messageTextField.placeholder = "输入消息..."
        messageTextField.backgroundColor = .white
        messageTextField.layer.cornerRadius = 16
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageTextField)
        
        sendButton = UIButton(type: .system)
        sendButton.setTitle("发送", for: .normal)
        sendButton.addTarget(self, action: #selector(onSendTapped), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        
        // 输入栏底部约束
        inputBarBottomConstraint = messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            // 输入栏约束
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
            messageTextField.heightAnchor.constraint(equalToConstant: 36),
            inputBarBottomConstraint,
            
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sendButton.bottomAnchor.constraint(equalTo: messageTextField.bottomAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 60),
            sendButton.heightAnchor.constraint(equalTo: messageTextField.heightAnchor),
            
            // TableView 约束，自动撑开
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: messageTextField.topAnchor, constant: -8)
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
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }
        
        let keyboardHeight = keyboardFrame.height - view.safeAreaInsets.bottom
        inputBarBottomConstraint.constant = -keyboardHeight - 8
        
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
        scrollToBottom()
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }
        
        inputBarBottomConstraint.constant = -16
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Send Message
    @objc private func onSendTapped() {
        guard let text = messageTextField.text, !text.isEmpty else { return }
        let msg = PublicMessage(avatarURL: nil, nickname: "我", text: text, isMine: true)
        appendMessage(msg)
        messageTextField.text = ""
        sendMessage(text)
    }
    
    func appendMessage(_ msg: PublicMessage) {
        messages.append(msg)
        tableView.reloadData()
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        guard messages.count > 0 else { return }
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "PublicMessageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PublicMessageCell ??
                   PublicMessageCell(style: .default, reuseIdentifier: cellId)
        cell.configure(with: messages[indexPath.row])
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1) // 翻转回正常
        return cell
    }
    // MARK: - RTM
    private func joinRTMChannel() {
        guard let roomId = yxRoomId else { return }
        TokenManager.shared.joinRTMChannel(channelId: roomId, delegate: self) { success in
            print(success ? "✅ 已加入公屏频道" : "❌ 加入公屏失败")
        }
    }
    
    func channel(_ channel: AgoraRtmChannel, messageReceived message: AgoraRtmMessage, from member: AgoraRtmMember) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let msg = PublicMessage(avatarURL: nil, nickname: member.userId, text: message.text, isMine: member.userId == self.userId)
            self.appendMessage(msg)
        }
    }
    
    func channel(_ channel: AgoraRtmChannel, memberJoined member: AgoraRtmMember) {}
    func channel(_ channel: AgoraRtmChannel, memberLeft member: AgoraRtmMember) {}
    
    func sendMessage(_ text: String) {
        TokenManager.shared.sendRTMMessage(text)
    }
}
