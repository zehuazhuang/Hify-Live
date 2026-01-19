import UIKit
import NIMSDK

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    let session: NIMSession
    var messages: [NIMMessage] = []

    private let tableView = UITableView()
    private let textField = UITextField()
    private let sendButton = UIButton(type: .system)

    // MARK: - Init
    init(session: NIMSession) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 13/255, green: 13/255, blue: 18/255, alpha: 1)

        setupTableView()
        setupNavigationBar()
        loadHistory()
    }

    // MARK: - TableView
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self

        // 注册 UITableViewCell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor), // inputAccessoryView 会覆盖底部
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - Navigation Bar
    private func setupNavigationBar() {
        navigationItem.title = "MadrigalXX1"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - inputAccessoryView
    override var inputAccessoryView: UIView? {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        container.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 38/255, alpha: 1)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type a message..."
        textField.textColor = .white
        textField.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 54/255, alpha: 1)
        textField.layer.cornerRadius = 20
        textField.delegate = self
        textField.returnKeyType = .send
        
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        
        container.addSubview(textField)
        container.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            textField.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            sendButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            sendButton.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        return container
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: - Send Action
    @objc private func sendTapped() {
        guard let text = textField.text, !text.isEmpty else { return }
        // 发送消息
        vmSendText(text: text)
        textField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendTapped()
        return true
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let msg = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.selectionStyle = .none
        cell.backgroundColor = .clear

        if msg.isOutgoingMsg {
            cell.textLabel?.textAlignment = .right
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .systemBlue
        } else {
            cell.textLabel?.textAlignment = .left
            cell.textLabel?.textColor = .black
            cell.textLabel?.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        }

        cell.textLabel?.text = msg.text ?? ""
        cell.textLabel?.layer.cornerRadius = 8
        cell.textLabel?.clipsToBounds = true
        cell.textLabel?.numberOfLines = 0

        return cell
    }

    // MARK: - Scroll to bottom
    private func scrollToBottom() {
        guard !messages.isEmpty else { return }
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    // MARK: - Load History (模拟)
    private func loadHistory() {
        // 假数据
        messages.append(contentsOf: [
            NIMMessage(), NIMMessage()
        ])
        tableView.reloadData()
        scrollToBottom()
    }

    private func vmSendText(text: String) {
        // 模拟发送消息
        let msg = NIMMessage()
        msg.text = text
        let session = NIMSession("对方ID", type: .P2P)
        messages.append(msg)
        tableView.reloadData()
        scrollToBottom()
    }
}
