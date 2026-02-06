import SwiftUI
import Kingfisher


struct ChatViewContainer: UIViewControllerRepresentable {
    let yxRoomId: String
    let userId: Int
    let onMuteTappedCallback: ((UInt, Bool) -> Void)?
    
    var onUserAvatarTapped: ((String) -> Void)?
    
    func didTapAvatar(userId: String) {
            onUserAvatarTapped?(userId)
        }
    
    
    func makeUIViewController(context: Context) -> ChatViewController {
        let vc = ChatViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.view.backgroundColor = .clear
        vc.yxRoomId = yxRoomId
        vc.userId = userId
        vc.onMuteTappedCallback = onMuteTappedCallback
        vc.preferredContentSize = CGSize(width: 0, height: 400)
        vc.onUserAvatarTapped = { uid in
                onUserAvatarTapped?(uid)
            }
        return vc
    }

    func updateUIViewController(_ uiViewController: ChatViewController, context: Context) {
            uiViewController.yxRoomId = yxRoomId
            uiViewController.userId = userId
      
            
        if(yxRoomId != ""){
            // ⚡ 这里触发 VC 内的 joinRTMChannel
                uiViewController.joinChatroom()

        }
                    
       
        }
}
// MARK: - PublicMessage Model
struct PublicMessage {
    let userId: String
    let avatarURL: String?
    let nickname: String
    let text: String
    var isMine: Bool
}

// MARK: - PublicMessageCell
class PublicMessageCell: UITableViewCell {

    private let avatarImageView = UIImageView()
    private let bubbleView = UIView()
    private let messageLabel = UILabel()
    
    var onAvatarTapped: (() -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let maxBubbleWidth = contentView.bounds.width - 32 - 8 - 8 - 8
        messageLabel.preferredMaxLayoutWidth = maxBubbleWidth
        super.layoutSubviews()
        
        
    }
    @objc private func avatarTapped() {
        onAvatarTapped?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.attributedText = nil
        onAvatarTapped = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear

        // 头像
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
            avatarImageView.addGestureRecognizer(tap)

        // 气泡
        bubbleView.layer.cornerRadius = 8
        bubbleView.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.25)
        bubbleView.translatesAutoresizingMaskIntoConstraints = false

        // 消息 Label
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        bubbleView.addSubview(messageLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(bubbleView)

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),

            bubbleView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            bubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8),
            bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 6),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 6),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -6)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with message: PublicMessage) {
    
        // 显示头像
        if let urlString = message.avatarURL, let url = URL(string: urlString) {
            avatarImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "gCZGrlvVVn1D"),
                options: [.transition(.fade(0.2)), .cacheOriginalImage]
            )
        } else {
            avatarImageView.image = UIImage(named: "gCZGrlvVVn1D")
        }

        // 拼接昵称 + 消息
        let attributedText = NSMutableAttributedString(
            string: message.nickname + ": ",
            attributes: [
                .foregroundColor: UIColor(red: 92/255, green: 222/255, blue: 255/255, alpha: 1),
                .font: UIFont.systemFont(ofSize: 14, weight: .semibold)
            ]
        )
        attributedText.append(NSAttributedString(
            string: message.text,
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 14)
            ]
        ))
        messageLabel.attributedText = attributedText
    }
}



