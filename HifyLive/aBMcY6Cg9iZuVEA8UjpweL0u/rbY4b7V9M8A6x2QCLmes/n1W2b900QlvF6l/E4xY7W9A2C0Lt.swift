import UIKit
import SwiftUI
import Kingfisher

final class ChatProfileHeaderView: UIView {

    // MARK: - UI
    private let bgImage = UIImageView()

    // 头像渐变
    private let avatarContainer = UIView()
    private let avatar = UIImageView()
    private let gradientLayer = CAGradientLayer()
    private let gradientMask = CAShapeLayer()

    private let nickname = UILabel()
    private let ageLabel = UILabel()
    private let genderIcon = UIImageView()
    private let dividerLabel = UILabel()
    private let countryIcon = UIImageView()

    private let followBtn = UIButton(type: .custom)

    private var collectionView: UICollectionView!
    private var userId: Int = 0

    // MARK: - Data
    private var pics: [String] = []

    private let heightWithPics: CGFloat = 140
    private let heightNoPics: CGFloat = 80
    
    private var currentAvatarURL: String = ""
    private var currentNickname: String = ""

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionView()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - UI
    private func setupUI() {
        backgroundColor = .clear

        bgImage.contentMode = .scaleToFill
        addSubview(bgImage)

        // 头像容器
        addSubview(avatarContainer)

        // 渐变边框
        gradientLayer.colors = [
            UIColor(red: 217/255, green: 28/255, blue: 1, alpha: 0.72).cgColor,
            UIColor(red: 49/255, green: 198/255, blue: 232/255, alpha: 0.1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        avatarContainer.layer.addSublayer(gradientLayer)

        gradientMask.fillRule = .evenOdd
        gradientLayer.mask = gradientMask

        // 头像
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        avatarContainer.addSubview(avatar)

        // 昵称
        nickname.font = JqA1kUIFont.font(size: 16, weight: .regular)
        nickname.textColor = .white
        addSubview(nickname)
        
        // 性别
        genderIcon.contentMode = .scaleAspectFit
        addSubview(genderIcon)

        // 年龄
        ageLabel.font = JqA1kUIFont.font(size: 14, weight: .regular)
        ageLabel.textColor = .white
        addSubview(ageLabel)

        

        // |
        dividerLabel.text = "|"
        dividerLabel.textColor = UIColor.white.withAlphaComponent(0.4)
        dividerLabel.font = JqA1kUIFont.font(size: 14, weight: .regular)
        addSubview(dividerLabel)

        // 国家
        countryIcon.contentMode = .scaleAspectFit
        addSubview(countryIcon)

        // 关注
        followBtn.setImage(UIImage(named: "qQ8ZC7E0ZxQ"), for: .normal)
        addSubview(followBtn)
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 68, height: 52)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self

        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        addSubview(collectionView)
    }
    
    private func setupActions() {
            followBtn.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        bgImage.frame = bounds

        // 头像渐变
        avatarContainer.frame = CGRect(x: 16, y: 16, width: 44, height: 44)
        gradientLayer.frame = avatarContainer.bounds

        let outer = UIBezierPath(ovalIn: avatarContainer.bounds)
        let inner = UIBezierPath(ovalIn: avatarContainer.bounds.insetBy(dx: 2, dy: 2))
        outer.append(inner)
        gradientMask.path = outer.cgPath

        avatar.frame = avatarContainer.bounds.insetBy(dx: 2, dy: 2)
        avatar.layer.cornerRadius = avatar.bounds.width / 2
        
        nickname.frame = CGRect(x: 64, y: 18, width: bounds.width - 160, height: 20)
        
        genderIcon.frame = CGRect(x: 64, y: 40, width: 24, height: 24)
        ageLabel.frame = CGRect(x: 90, y: 43, width: 30, height: 18)
        dividerLabel.frame = CGRect(x: 120, y: 43, width: 8, height: 18)
        countryIcon.frame = CGRect(x: 132, y: 43, width: 16, height: 16)

        followBtn.frame = CGRect(x: bounds.width - 64, y: 24, width: 48, height: 32)

        collectionView.frame = CGRect(
            x: 16,
            y: 64,
            width: bounds.width - 32,
            height: 60
        )
    }

    // MARK: - Update
    func update(info: [String: Any]) {
        
        
        currentAvatarURL = info["icon"] as? String ?? ""
        currentNickname = info["nickname"] as? String ?? ""
        
        if let id = info["userId"] as? Int {
            userId = id
        }

        nickname.text = currentNickname
        ageLabel.text = "\(info["age"] as? Int ?? 0)"

        if let icon = info["icon"] as? String {
            avatar.kf.setImage(with: URL(string: icon))
        }
        
        // 性别
        let gender = info["gender"] as? Int ?? 0
        genderIcon.image = UIImage(
            named: gender == 1 ? "h8bx8HHiJD1BodEG8Zfzl" : "aSUqulEy"
        )
        
        let followed: Bool
        if let f = info["followed"] as? Bool {
            followed = f
        } else if let f = info["followed"] as? Int {
            followed = f == 1
        } else {
            followed = false
        }

        let followImage = followed ? "qQ8ZC7E0ZxQ" : "d2ax6W4EYC8L"
        followBtn.setImage(UIImage(named: followImage), for: .normal)

        // 国家
        if let country = info["country"] as? String {
            countryIcon.image = UIImage(named: country)
        }

        // 相册
        let hasPics: Bool
        if let list = info["picList"] as? [[String: Any]] {
            pics = list.compactMap { $0["mediaUrl"] as? String }
            hasPics = !pics.isEmpty
        } else {
            pics = []
            hasPics = false
        }

        bgImage.image = UIImage(
            named: hasPics ? "kY9WxQ2W4L" : "dA7M4Z0x4C8E2Z"
        )

        collectionView.isHidden = !hasPics

        frame.size.height = hasPics ? heightWithPics : heightNoPics

        collectionView.reloadData()
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    @objc private func followTapped() {
        guard let currentImage = followBtn.image(for: .normal) else { return }
        let isFollowed = currentImage == UIImage(named: "qQ8ZC7E0ZxQ")
        let userId = self.userId

        Task {
            do {
                if isFollowed {
                    // 已关注 → 弹出取关确认弹窗
                    if let topVC = UIApplication.topViewController() {
                        
                       
                        var alertVC: UIHostingController<W9MZC6xA7Q8Y4L>? = nil
                       
                        alertVC = UIHostingController(
                            rootView: W9MZC6xA7Q8Y4L(
                                avatarURL: currentAvatarURL,
                                nickname: currentNickname,
                                onClose: {
                                    alertVC?.dismiss(animated: true)
                                },
                                onUnfollow: { [weak self] in
                                    guard let self = self else { return }
                                    Task {
                                        do {
                                            try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: userId, iA6M7W9EYL0: 2)
                                            self.followBtn.setImage(UIImage(named: "d2ax6W4EYC8L"), for: .normal)
                                            alertVC?.dismiss(animated: true)
                                            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("EMnULaLM6ZF45iH0cANSKQ==")
                                        } catch {
                                            print(error)
                                        }
                                    }
                                }
                            )
                        )
                        
                        alertVC!.modalPresentationStyle = .overFullScreen
                        alertVC!.modalTransitionStyle = .crossDissolve
                        alertVC!.view.backgroundColor = .clear
                        topVC.present(alertVC!, animated: true)
                    }
                } else {
                    // 未关注 → 直接关注
                    try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: userId, iA6M7W9EYL0: 1)
                    followBtn.setImage(UIImage(named: "qQ8ZC7E0ZxQ"), for: .normal)
                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("j6N2OHmBLAbXPzqOtT0sAA==")
                }
            } catch {
                print(error)
            }
        }
    }
}
final class PhotoCell: UICollectionViewCell {

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func update(url: String) {
        imageView.kf.setImage(with: URL(string: url))
    }
}

extension ChatProfileHeaderView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        min(pics.count, 4)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PhotoCell",
            for: indexPath
        ) as! PhotoCell

        cell.update(url: pics[indexPath.item])
        return cell
    }
}
extension UIApplication {
    static func topViewController(
        _ base: UIViewController? = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?.rootViewController
    ) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}

