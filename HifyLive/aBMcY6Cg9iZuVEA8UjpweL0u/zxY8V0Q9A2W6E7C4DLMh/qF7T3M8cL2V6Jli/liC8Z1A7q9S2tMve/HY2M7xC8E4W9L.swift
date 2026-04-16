import SwiftUI
import Kingfisher
//直播页弹幕

struct ChatViewContainer: UIViewControllerRepresentable {
    let yxRoomId: String
    let userId: Int
    let hostYxAccid: String
    let onMuteTappedCallback: ((UInt, Bool) -> Void)? //静音回调
    
    var onUserAvatarTapped: ((String) -> Void)? //头像回调
    
    var ong4Gu8Ogiska: () -> Void //点击礼物
    
    var w8esoH7cO33: ()-> Void //点击私聊
    
    var onReceiveGift: ((String, Int, Int) -> Void)? // giftImg, giftNum, giftId
    
    var nd8XGgxX9b: ((Bool) -> Void) //加入离开直播间 true 加入 false 离开
    
    func didTapAvatar(userId: String) {
            onUserAvatarTapped?(userId)
        }
    
    
    func makeUIViewController(context: Context) -> ChatViewController {
        let vc = ChatViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.view.backgroundColor = .clear
        vc.yxRoomId = yxRoomId
        vc.userId = userId
        vc.hostYxAccid = hostYxAccid
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
        
        vc.nd8XGgxX9b = { rfvgzQ4 in
            nd8XGgxX9b(rfvgzQ4)
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: ChatViewController, context: Context) {
            uiViewController.yxRoomId = yxRoomId
            uiViewController.userId = userId
        uiViewController.hostYxAccid = hostYxAccid
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
    case notice(String)
}


struct PublicMessage {
    let userId: String
    let avatarURL: String?
    let nickname: String
    let type: ChatMessageType
    var isMine: Bool
    let isHost: Bool
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
    
    //公告
    private let noticeView = NoticeBubbleView()

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
        avatarImageView.layer.cornerRadius = 12
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
        
        
        contentView.addSubview(noticeView)          // ✅ 添加公告视图
                noticeView.translatesAutoresizingMaskIntoConstraints = false

                NSLayoutConstraint.activate([
                    noticeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    noticeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                    noticeView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8),
                    noticeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
                ])
                
                noticeView.isHidden = true
    }

    // MARK: - Layout

    private func setupLayout() {
        
        stackTopConstraint = messageStack.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 6)
        stackBottomConstraint = messageStack.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6)


        NSLayoutConstraint.activate([

            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                avatarImageView.widthAnchor.constraint(equalToConstant: 24),
                avatarImageView.heightAnchor.constraint(equalToConstant: 24),

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
        } else {
            
            avatarImageView.image = UIImage(named: "gCZGrlvVVn1D")
        }

        switch message.type {
        case .notice(let text):
            noticeView.isHidden = false
              bubbleView.isHidden = true
              avatarImageView.isHidden = true
              bubbleToAvatarConstraint.isActive = false
              bubbleToLeftConstraint.isActive = false

              noticeView.setGradientText(text, colors: [
                UIColor(red: 16/255, green: 227/255, blue: 255/255, alpha: 1),
                UIColor(red: 85/255, green: 255/255, blue: 28/255, alpha: 1)
              ])
        case .text(let text):
            stackTopConstraint.constant = 4
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
            
            let maxLength = 12
            let nickname = message.nickname.count > maxLength
                ? String(message.nickname.prefix(maxLength)) + "..."
                : message.nickname

            let nameFont = JqA1kUIFont.font(size: 14, weight: .semibold)
            let textFont = JqA1kUIFont.font(size: 14, weight: .regular)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4   // 控制“名字行”和“正文行”的间距

            let attributedText = NSMutableAttributedString(
                string: nickname,
                attributes: [
                    .foregroundColor: UIColor(
                        red: 92/255,
                        green: 222/255,
                        blue: 255/255,
                        alpha: 1
                    ),
                    .font: nameFont,
                    .paragraphStyle: paragraphStyle
                ]
            )

            if message.isHost, let image = UIImage(named: "mG8XPUzMhxN4") {
                attributedText.append(NSAttributedString(string: " "))

                let attachment = NSTextAttachment()
                attachment.image = image

                let badgeHeight: CGFloat = 18
                let badgeWidth: CGFloat = 50
                let yOffset = (nameFont.capHeight - badgeHeight) / 2
                attachment.bounds = CGRect(x: 0, y: yOffset, width: badgeWidth, height: badgeHeight)

                attributedText.append(NSAttributedString(attachment: attachment))
            }

            attributedText.append(
                NSAttributedString(
                    string: "\n" + text,
                    attributes: [
                        .foregroundColor: UIColor.white,
                        .font: textFont,
                        .paragraphStyle: paragraphStyle
                    ]
                )
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



final class NoticeBubbleView: UIView {

    private let bubbleView = UIView()
    private let messageLabel = UILabel()
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
        bubbleView.layer.cornerRadius = 8
        bubbleView.layer.masksToBounds = true
        bubbleView.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.25)

        // 设置渐变颜色（可以修改成自己想要的渐变）
        gradientLayer.colors = [
            UIColor(red: 16/255, green: 227/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 85/255, green: 255/255, blue: 28/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        bubbleView.layer.insertSublayer(gradientLayer, at: 0)

        messageLabel.font = JqA1kUIFont.font(size: 14, weight: .semibold)
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0

        addSubview(bubbleView)
        bubbleView.addSubview(messageLabel)

        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bubbleView.topAnchor.constraint(equalTo: topAnchor),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor),

            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 6),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -6),
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 6),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bubbleView.bounds
    }

    /// 设置文字并渐变
    func setGradientText(_ text: String, colors: [UIColor]) {
        messageLabel.text = text
        messageLabel.layoutIfNeeded() // 确保 AutoLayout 更新完

        gradientLayer.removeFromSuperlayer() // 避免重复添加
        gradientLayer.frame = bubbleView.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)

        // 使用 label 的 layer 作为 mask
        messageLabel.layer.removeFromSuperlayer()
        gradientLayer.mask = messageLabel.layer
        bubbleView.layer.addSublayer(gradientLayer)
    }
}
