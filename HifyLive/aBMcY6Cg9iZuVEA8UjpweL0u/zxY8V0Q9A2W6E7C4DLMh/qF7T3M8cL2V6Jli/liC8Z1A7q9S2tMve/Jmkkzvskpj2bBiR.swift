

import UIKit
import Kingfisher

class GiftFloatView: UIView {

    // 渐变背景包住头像、名字、send、礼物
    private let backgroundGradientView = yuYrRMXg3()
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let sendLabel = UILabel()
    private let giftImageView = UIImageView()

    // 数量
    private let countStack = UIStackView()
    private let xImageView = UIImageView()
    var countLabel = UILabel()
    
    
    // 当前悬停倒计时
    private var stayTimer: Timer?
    
    // 当前用户+礼物标识
    var currentKey: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        isHidden = true // 默认隐藏
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        isHidden = true
    }
    
    func hideGift() {
        dismissGift() // 公开接口，外部可调用
    }
    
    private func setupUI() {
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        // 渐变背景
        addSubview(backgroundGradientView)
        backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundGradientView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGradientView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundGradientView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundGradientView.widthAnchor.constraint(equalToConstant: 221) // 留出空间给数量气泡
        ])
        backgroundGradientView.clipsToBounds = true

        // 渐变背景内部控件
        [avatarImageView, nameLabel, sendLabel, giftImageView].forEach {
            backgroundGradientView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        avatarImageView.layer.cornerRadius = 21
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill

        nameLabel.textColor = .white
        nameLabel.font = .boldSystemFont(ofSize: 14)

        sendLabel.textColor = .white
        sendLabel.font = .systemFont(ofSize: 12)
        sendLabel.text = "send"

        giftImageView.contentMode = .scaleAspectFit

        let nameStack = UIStackView(arrangedSubviews: [nameLabel, sendLabel])
        nameStack.axis = .vertical
        nameStack.spacing = 0
        nameStack.alignment = .leading
        
        
        let contentStack = UIStackView(arrangedSubviews: [avatarImageView, nameStack, giftImageView])
        contentStack.axis = .horizontal
        contentStack.spacing = 4
        contentStack.alignment = .center
        backgroundGradientView.addSubview(contentStack)
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: backgroundGradientView.leadingAnchor, constant: 6),
            contentStack.trailingAnchor.constraint(equalTo: backgroundGradientView.trailingAnchor, constant: -6),
        ])
        
        addSubview(countStack)
        countStack.translatesAutoresizingMaskIntoConstraints = false
        countStack.axis = .horizontal
        countStack.alignment = .center
        countStack.spacing = 2
        
        NSLayoutConstraint.activate([
            countStack.leadingAnchor.constraint(equalTo: backgroundGradientView.trailingAnchor, constant: 4),
            countStack.centerYAnchor.constraint(equalTo: backgroundGradientView.centerYAnchor)
        ])
        
        xImageView.image = UIImage(named: "ulzb7LfsuPK")
        xImageView.contentMode = .scaleAspectFit
        xImageView.transform = CGAffineTransform(translationX: 0, y: 5)

        NSLayoutConstraint.activate([
            xImageView.widthAnchor.constraint(equalToConstant: 14),
            xImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        countLabel.textColor = .white
        countLabel.font = .boldSystemFont(ofSize: 14)

        countStack.addArrangedSubview(xImageView)
        countStack.addArrangedSubview(countLabel)
        
        
        
        // 布局渐变内部控件
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: backgroundGradientView.leadingAnchor, constant: 6),
            avatarImageView.centerYAnchor.constraint(equalTo: backgroundGradientView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 42),
            avatarImageView.heightAnchor.constraint(equalToConstant: 42),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            nameLabel.topAnchor.constraint(equalTo: backgroundGradientView.topAnchor, constant: 6),

            sendLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            sendLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),

            giftImageView.trailingAnchor.constraint(equalTo: backgroundGradientView.trailingAnchor, constant: -8),
            giftImageView.centerYAnchor.constraint(equalTo: backgroundGradientView.centerYAnchor),
            giftImageView.widthAnchor.constraint(equalToConstant: 48),
            giftImageView.heightAnchor.constraint(equalToConstant: 48),

        ])
        
 
    }

    // MARK: - 显示/更新礼物
    func showGift(_ msg: PublicMessage, stayDuration: TimeInterval = 1.5) {

        let key = "\(msg.userId)_\(msg.type.giftId ?? 0)"
        self.currentKey = key

        nameLabel.text = msg.nickname
        
        let count = msg.type.giftCount ?? 0
        let text = "\(count)"

        let attr = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor(red: 255/255, green: 55/255, blue: 28/255, alpha: 1),
                .strokeColor: UIColor.white,
                .strokeWidth: -3.0,
                .font: JqA1kUIFont.font(size: 32, weight: .black)
            ]
        )

        countLabel.attributedText = attr
        
        avatarImageView.kf.setImage(with: URL(string: msg.avatarURL ?? ""), placeholder: UIImage(named: "gCZGrlvVVn1D"))
        giftImageView.kf.setImage(with: URL(string: msg.type.giftImageURL ?? ""))

        layer.removeAllAnimations()
        alpha = 0
        transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        isHidden = false

        // 入场动画 0.5秒
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1
            self.transform = .identity
        }) { _ in
            // 启动悬停倒计时
            self.startStayTimer(duration: stayDuration)
        }
    }

    private func startStayTimer(duration: TimeInterval) {
        stayTimer?.invalidate()
        stayTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self] _ in
            self?.dismissGift()
        }
    }

    func resetStayTimer(duration: TimeInterval = 1.5) {
        stayTimer?.invalidate()
        startStayTimer(duration: duration)
    }

    private func dismissGift() {
        stayTimer?.invalidate()
        stayTimer = nil

        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        }) { _ in
            self.isHidden = true
        }
    }
}
// 渐变气泡类
final class yuYrRMXg3: UIView {

    override class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private static let giftColors: [CGColor] = [
        UIColor(red: 239/255, green: 186/255, blue: 217/255, alpha: 1).cgColor,
        UIColor(red: 92/255, green: 118/255, blue: 219/255, alpha: 0.86).cgColor,
        UIColor(red: 79/255, green: 99/255, blue: 201/255, alpha: 0.01).cgColor
    ]

    private func setup() {
        layer.masksToBounds = true
        gradientLayer.colors = Self.giftColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }

    // ⚠️ 关键：在 layoutSubviews 更新 frame 和 cornerRadius
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.height / 2
    }
}
