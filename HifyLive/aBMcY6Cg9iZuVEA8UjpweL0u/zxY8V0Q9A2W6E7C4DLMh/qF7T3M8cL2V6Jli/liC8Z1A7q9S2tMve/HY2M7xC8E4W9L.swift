import SwiftUI
import Kingfisher
//直播页弹幕

struct ChatViewContainer: UIViewControllerRepresentable {
    let yxRoomId: String
    let userId: Int
    let onMuteTappedCallback: ((UInt, Bool) -> Void)?
    
    var onUserAvatarTapped: ((String) -> Void)?
    
    var ong4Gu8Ogiska: () -> Void //点击礼物
    
    var onReceiveGift: ((String, Int, Int) -> Void)? // giftImg, giftNum, giftId
    
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
        vc.onGiftTapped = {
            ong4Gu8Ogiska()
        }
        
        // ✅ 绑定礼物回调
               vc.onReceiveGift = { giftImg, giftNum, giftId in
                   onReceiveGift?(giftImg, giftNum, giftId)
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

enum ChatMessageType {
    case text(String)          // 普通文本消息
    case gift(imgURL: String, count: Int, giftId: Int) // 礼物消息
}


struct PublicMessage {
    let userId: String
    let avatarURL: String?
    let nickname: String
    let type: ChatMessageType
    var isMine: Bool
}

// MARK: - PublicMessageCell
class PublicMessageCell: UITableViewCell {

    private let avatarImageView = UIImageView()
        private let bubbleView = UIView()
        private let messageLabel = UILabel()
        private let giftImageView = UIImageView()
        private let giftCountLabel = UILabel()
    
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

            avatarImageView.contentMode = .scaleAspectFill
            avatarImageView.layer.cornerRadius = 16
            avatarImageView.clipsToBounds = true
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            avatarImageView.isUserInteractionEnabled = true
            avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTapped)))
            
            bubbleView.layer.cornerRadius = 8
            bubbleView.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.25)
            bubbleView.translatesAutoresizingMaskIntoConstraints = false

            messageLabel.numberOfLines = 0
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            
            giftImageView.translatesAutoresizingMaskIntoConstraints = false
            giftCountLabel.translatesAutoresizingMaskIntoConstraints = false
            giftCountLabel.textColor = .white
            giftCountLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)

            bubbleView.addSubview(messageLabel)
            bubbleView.addSubview(giftImageView)
            bubbleView.addSubview(giftCountLabel)
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
                messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 6),
                messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -6),
                messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6),

                giftImageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 4),
                giftImageView.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 6),
                giftImageView.widthAnchor.constraint(equalToConstant: 24),
                giftImageView.heightAnchor.constraint(equalToConstant: 24),

                giftCountLabel.centerYAnchor.constraint(equalTo: giftImageView.centerYAnchor),
                giftCountLabel.leadingAnchor.constraint(equalTo: giftImageView.trailingAnchor, constant: 4)
            ])
        }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with message: PublicMessage) {
            if let urlString = message.avatarURL, let url = URL(string: urlString) {
                avatarImageView.kf.setImage(with: url, placeholder: UIImage(named: "gCZGrlvVVn1D"))
            } else {
                avatarImageView.image = UIImage(named: "gCZGrlvVVn1D")
            }

            switch message.type {
            case .text(let text):
                messageLabel.isHidden = false
                giftImageView.isHidden = true
                giftCountLabel.isHidden = true
                
                let attributedText = NSMutableAttributedString(
                    string: message.nickname + ": ",
                    attributes: [.foregroundColor: UIColor(red: 92/255, green: 222/255, blue: 255/255, alpha: 1), .font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
                )
                attributedText.append(NSAttributedString(
                    string: text,
                    attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14)]
                ))
                messageLabel.attributedText = attributedText
            case .gift(_, let num, _):

                    let attributedText = NSMutableAttributedString(
                        string: message.nickname,
                        attributes: [
                            .foregroundColor: UIColor(
                                red: 92/255,
                                green: 222/255,
                                blue: 255/255,
                                alpha: 1
                            ),
                            .font: UIFont.systemFont(ofSize: 14, weight: .semibold)
                        ]
                    )

                    attributedText.append(
                        NSAttributedString(
                            string: " sent gift x\(num)",
                            attributes: [
                                .foregroundColor: UIColor.white,
                                .font: UIFont.systemFont(ofSize: 14)
                            ]
                        )
                    )

                    messageLabel.attributedText = attributedText
            }
        }
}



