import SwiftUI
import Kingfisher
//直播页弹幕

struct ChatViewContainer: UIViewControllerRepresentable {
    let yxRoomId: String
    let userId: Int
    let onMuteTappedCallback: ((UInt, Bool) -> Void)? //静音回调
    
    var onUserAvatarTapped: ((String) -> Void)? //头像回调
    
    var ong4Gu8Ogiska: () -> Void //点击礼物
    
    var w8esoH7cO33: ()-> Void //点击私聊
    
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
        vc.puO2kKxCh = {
            w8esoH7cO33()
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

extension ChatMessageType {
    var giftId: Int? {
        if case let .gift(_, _, id) = self {
            return id
        }
        return nil
    }
    
    var giftCount: Int? {
        if case let .gift(_, count, _) = self {
            return count
        }
        return nil
    }
    
    var giftImageURL: String? {
        if case let .gift(imgURL, _, _) = self {
            return imgURL
        }
        return nil
    }
}

// MARK: - PublicMessageCell
class PublicMessageCell: UITableViewCell {

    private let avatarImageView = UIImageView()
    private let bubbleView = yiLW5rmx9PView()

    private let messageStack = UIStackView()
    private let messageLabel = UILabel()
    private let giftImageView = UIImageView()
    private let giftCountLabel = UILabel()
    
    private var bubbleToAvatarConstraint: NSLayoutConstraint!
    private var bubbleToLeftConstraint: NSLayoutConstraint!
    
    private var stackTopConstraint: NSLayoutConstraint!
    private var stackBottomConstraint: NSLayoutConstraint!

    var onAvatarTapped: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .clear

        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - UI

    private func setupViews() {
        
        bubbleToAvatarConstraint = bubbleView.leadingAnchor.constraint(
            equalTo: avatarImageView.trailingAnchor,
            constant: 8
        )

        bubbleToLeftConstraint = bubbleView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 8
        )

        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 16
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        )

        
        bubbleView.backgroundColor = UIColor(
            red: 34/255,
            green: 34/255,
            blue: 34/255,
            alpha: 0.25
        )
        bubbleView.translatesAutoresizingMaskIntoConstraints = false

        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        giftImageView.translatesAutoresizingMaskIntoConstraints = false
        giftImageView.isHidden = true

        giftCountLabel.textColor = .white
        giftCountLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        giftCountLabel.translatesAutoresizingMaskIntoConstraints = false
        giftCountLabel.isHidden = true

        messageStack.axis = .horizontal
        messageStack.spacing = 4
        messageStack.alignment = .center
        messageStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(avatarImageView)
        contentView.addSubview(bubbleView)

        bubbleView.addSubview(messageStack)

        messageStack.addArrangedSubview(messageLabel)
        messageStack.addArrangedSubview(giftImageView)
        messageStack.addArrangedSubview(giftCountLabel)

        giftImageView.contentMode = .scaleAspectFit
        giftImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        giftImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }

    // MARK: - Layout

    private func setupLayout() {
        
        stackTopConstraint = messageStack.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 6)
        stackBottomConstraint = messageStack.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6)


        NSLayoutConstraint.activate([

            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                avatarImageView.widthAnchor.constraint(equalToConstant: 32),
                avatarImageView.heightAnchor.constraint(equalToConstant: 32),

                bubbleToAvatarConstraint,

                bubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8),
                bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

                stackTopConstraint,
                stackBottomConstraint,
                messageStack.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 6),
                messageStack.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -6),
                

        ])
    }

    // MARK: - Configure

    func configure(with message: PublicMessage) {

        if let urlString = message.avatarURL,
           let url = URL(string: urlString) {

            avatarImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "gCZGrlvVVn1D")
            )
        }

        switch message.type {

        case .text(let text):
            stackTopConstraint.constant = 6
            stackBottomConstraint.constant = -6
            bubbleView.isHidden = false
            bubbleView.gradientLayer.cornerRadius = 8
                bubbleView.gradientLayer.colors = [
                    UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.25).cgColor,
                    UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.25).cgColor
                ]

            avatarImageView.isHidden = false
            giftImageView.isHidden = true
            giftCountLabel.isHidden = true
            bubbleToAvatarConstraint.isActive = true
            bubbleToLeftConstraint.isActive = false
            
            let attributedText = NSMutableAttributedString(
                string: message.nickname + ": ",
                attributes: [
                    .foregroundColor: UIColor(
                        red: 92/255,
                        green: 222/255,
                        blue: 255/255,
                        alpha: 1
                    ),
                    .font: JqA1kUIFont.font(size: 14, weight: .semibold)
                ])

            attributedText.append(
                NSAttributedString(
                    string: text,
                    attributes: [
                        .foregroundColor: UIColor.white,
                        .font: JqA1kUIFont.font(size: 14, weight: .regular)
                    ])
            )

            messageLabel.attributedText = attributedText


        case .gift(let imgURL, let num, _):
            
            
            stackTopConstraint.constant = 0
            stackBottomConstraint.constant = 0
            bubbleView.gradientLayer.cornerRadius = 16
            bubbleView.gradientLayer.colors = [
                    UIColor(red: 138/255, green: 120/255, blue: 255/255, alpha: 0.25).cgColor,
                    UIColor(red: 170/255, green: 84/255, blue: 255/255, alpha: 0.23).cgColor
                ]
            avatarImageView.isHidden = true
            giftImageView.isHidden = false
            giftImageView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            bubbleView.clipsToBounds = false
            messageStack.clipsToBounds = false
            
            giftCountLabel.isHidden = false
            bubbleToAvatarConstraint.isActive = false
            bubbleToLeftConstraint.isActive = true
            
            let attributedText = NSMutableAttributedString(
                string: "  \(message.nickname)",
                attributes: [
                    .foregroundColor: UIColor.white,
                    .font: JqA1kUIFont.font(size: 14, weight: .semibold)
                ])
            
            attributedText.append(
                NSAttributedString(
                    string: "  send ",
                    attributes: [
                        .foregroundColor: UIColor.white,
                        .font: JqA1kUIFont.font(size: 14, weight: .regular)
                    ])
            )

            messageLabel.attributedText = attributedText

            if let url = URL(string: imgURL) {
                giftImageView.kf.setImage(with: url)
            }
            
            let kJ6HiNumText = NSMutableAttributedString(
                string: "x ",
                attributes: [
                    .foregroundColor: UIColor.white,
                    .font: JqA1kUIFont.font(size: 12, weight: .black)
                ])
            
            kJ6HiNumText.append(
                NSAttributedString(
                    string: "\(num)  ",
                    attributes: [
                        .foregroundColor: UIColor.white,
                        .font: JqA1kUIFont.font(size: 18, weight: .black)
                    ])
            )
            
            giftCountLabel.attributedText = kJ6HiNumText
        }
    }

    @objc private func avatarTapped() {
        onAvatarTapped?()
    }
}


//礼物气泡
final class yiLW5rmx9PView: UIView {

    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private static let giftColors: [CGColor] = [
        UIColor(red: 138/255, green: 120/255, blue: 255/255, alpha: 0.25).cgColor,
        UIColor(red: 170/255, green: 84/255, blue: 255/255, alpha: 0.23).cgColor
    ]

    private func setup() {
        layer.masksToBounds = true
        gradientLayer.cornerRadius = 16

        gradientLayer.colors = Self.giftColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }

}


final class GiftBubbleView: UIView {

    private let bubbleView = UIView()
    private let giftImageView = UIImageView()
    private let giftCountLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupLayout()
    }

    private func setupViews() {
        bubbleView.layer.cornerRadius = 20
        bubbleView.layer.masksToBounds = true
        bubbleView.backgroundColor = .clear

        gradientLayer.colors = [
            UIColor(red: 138/255, green: 120/255, blue: 255/255, alpha: 0.25).cgColor,
            UIColor(red: 170/255, green: 84/255, blue: 255/255, alpha: 0.23).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        bubbleView.layer.insertSublayer(gradientLayer, at: 0)

        giftImageView.contentMode = .scaleAspectFit
        giftCountLabel.font = .systemFont(ofSize: 16, weight: .black)
        giftCountLabel.textColor = .white
        nicknameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        nicknameLabel.textColor = .white

        addSubview(bubbleView)
        bubbleView.addSubview(giftImageView)
        bubbleView.addSubview(giftCountLabel)
        bubbleView.addSubview(nicknameLabel)

        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        giftImageView.translatesAutoresizingMaskIntoConstraints = false
        giftCountLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bubbleView.topAnchor.constraint(equalTo: topAnchor),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor),

            giftImageView.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 8),
            giftImageView.centerYAnchor.constraint(equalTo: bubbleView.centerYAnchor),
            giftImageView.widthAnchor.constraint(equalToConstant: 40),
            giftImageView.heightAnchor.constraint(equalToConstant: 40),

            nicknameLabel.leadingAnchor.constraint(equalTo: giftImageView.trailingAnchor, constant: 8),
            nicknameLabel.centerYAnchor.constraint(equalTo: bubbleView.centerYAnchor),

            giftCountLabel.leadingAnchor.constraint(equalTo: nicknameLabel.trailingAnchor, constant: 4),
            giftCountLabel.centerYAnchor.constraint(equalTo: bubbleView.centerYAnchor),
            giftCountLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -8)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bubbleView.bounds
    }

    func configure(nickname: String, giftImageURL: String, count: Int) {
        nicknameLabel.text = nickname
        giftCountLabel.text = "x\(count)"
        if let url = URL(string: giftImageURL) {
            giftImageView.kf.setImage(with: url)
        }
    }
}
