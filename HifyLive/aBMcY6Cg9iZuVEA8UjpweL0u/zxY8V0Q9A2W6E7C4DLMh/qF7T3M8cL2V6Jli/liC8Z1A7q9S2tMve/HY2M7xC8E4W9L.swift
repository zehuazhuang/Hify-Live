import SwiftUI



struct ChatViewContainer: UIViewControllerRepresentable {
    let yxRoomId: String
    let userId: String
    
    func makeUIViewController(context: Context) -> ChatViewController {
        let vc = ChatViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.view.backgroundColor = .clear
        vc.yxRoomId = yxRoomId
        vc.userId = userId
        return vc
    }

    func updateUIViewController(_ uiViewController: ChatViewController, context: Context) {}
}
// MARK: - PublicMessage Model
struct PublicMessage {
    let avatarURL: String?
    let nickname: String
    let text: String
    var isMine: Bool
}

// MARK: - PublicMessageCell
class PublicMessageCell: UITableViewCell {
    private let avatarImageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let messageLabel = UILabel()
    private let bubbleView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)
        
        nicknameLabel.font = UIFont.systemFont(ofSize: 12)
        nicknameLabel.textColor = .white
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nicknameLabel)
        
        bubbleView.layer.cornerRadius = 12
        bubbleView.clipsToBounds = true
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bubbleView)
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),
            
            nicknameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nicknameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            
            bubbleView.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 4),
            bubbleView.leadingAnchor.constraint(equalTo: nicknameLabel.leadingAnchor),
            bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(with message: PublicMessage) {
        nicknameLabel.text = message.nickname
        messageLabel.text = message.text
        avatarImageView.image = UIImage(systemName: "person.circle.fill")
        bubbleView.backgroundColor = message.isMine ? .systemBlue : .darkGray
    }
}
