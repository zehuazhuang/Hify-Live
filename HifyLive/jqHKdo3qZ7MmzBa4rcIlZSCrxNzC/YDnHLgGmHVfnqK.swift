//
//  YDnHLgGmHVfnqK.swift
//  HifyLive
//
//  Created by yangyang on 2026/2/2.
//

import UIKit
import SwiftUI
import Kingfisher
//图片放大

struct ZQ9FPreviewWrapper: UIViewControllerRepresentable {

    let pics: [String]          // 多张图片
    let startIndex: Int          // 默认显示哪一张

    func makeUIViewController(context: Context) -> UIViewController {
        // 返回新的多图滑动预览 VC
        let vc = ImagePreviewScrollViewController(pics: pics, startIndex: startIndex)
        return vc
    }
    

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
}


final class ImagePreviewScrollViewController: UIViewController, UIScrollViewDelegate {

    private let pics: [String]
    private var startIndex: Int
    private let scrollView = UIScrollView()
    
    private let hintLabel = UILabel()

    init(pics: [String], startIndex: Int) {
        self.pics = pics
        self.startIndex = startIndex
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }

    required init?(coder: NSCoder) { fatalError() }
    
    @objc private func saveFinished(
        _ image: UIImage,
        didFinishSavingWithError error: Error?,
        contextInfo: UnsafeRawPointer
    ) {
        if error == nil {
            
            showHint(message: "Saved successfully")
        } else {
            print(error!)
        }
    }
    
    @objc private func longPressSave(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began,
              let imageView = gesture.view as? UIImageView,
              let image = imageView.image
        else { return }

        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        alert.addAction(UIAlertAction(title: "Save to album", style: .default) { _ in
            UIImageWriteToSavedPhotosAlbum(
                image,
                self,
                #selector(self.saveFinished(_:didFinishSavingWithError:contextInfo:)),
                nil
            )
        })

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        present(alert, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        view.insetsLayoutMarginsFromSafeArea = false
        view.frame = UIScreen.main.bounds

        setupScrollView()
        loadImages()
        scrollToStartIndex(animated: false)
        
    }
    
    private func showHint(message: String) {
        // UILabel 自带内边距需要自定义
        class PaddedLabel: UILabel {
            var insets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
            override func drawText(in rect: CGRect) {
                super.drawText(in: rect.inset(by: insets))
            }
            override var intrinsicContentSize: CGSize {
                let size = super.intrinsicContentSize
                return CGSize(width: size.width + insets.left + insets.right,
                              height: size.height + insets.top + insets.bottom)
            }
        }

        let hintLabel = PaddedLabel()
        hintLabel.text = message
        hintLabel.textColor = .black
        hintLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        hintLabel.textAlignment = .center
        hintLabel.backgroundColor = .white
        hintLabel.numberOfLines = 0 // 多行
        hintLabel.layer.cornerRadius = 12
        hintLabel.layer.masksToBounds = true // 圆角生效

        // 阴影容器
        let container = UIView()
        container.backgroundColor = .clear
        container.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        container.layer.shadowOpacity = 1
        container.layer.shadowRadius = 5
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.alpha = 0

        container.addSubview(hintLabel)
        view.addSubview(container)

        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hintLabel.topAnchor.constraint(equalTo: container.topAnchor),
            hintLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            hintLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            hintLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),

            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 30),
            container.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -30)
        ])

        UIView.animate(withDuration: 0.25) {
            container.alpha = 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 0.25, animations: {
                container.alpha = 0
            }) { _ in
                container.removeFromSuperview()
            }
        }
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
       
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // 单击关闭
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissSelf))
        view.addGestureRecognizer(tap)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView != self.scrollView, let imageView = scrollView.subviews.first as? UIImageView {
            centerImageView(imageView, in: scrollView)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 更新外层 scrollView 的 frame（确保考虑安全区）
        scrollView.frame = view.bounds

        // 更新每个图片 scrollView 和 imageView 居中
        for subScroll in scrollView.subviews {
            guard let imageScrollView = subScroll as? UIScrollView,
                  let imageView = imageScrollView.subviews.first as? UIImageView
            else { continue }
            
            // 更新 scrollView 的 frame
            let index = scrollView.subviews.firstIndex(of: imageScrollView) ?? 0
            imageScrollView.frame = CGRect(
                x: CGFloat(index) * scrollView.bounds.width,
                y: 0,
                width: scrollView.bounds.width,
                height: scrollView.bounds.height
            )
            
            // 更新 contentSize 如果图片已经加载
            let imageSize = imageView.frame.size
            imageScrollView.contentSize = imageSize
            
            // 居中
            centerImageView(imageView, in: imageScrollView)
        }
        
        // 确保保持当前页
        scrollToStartIndex(animated: false)
    }
    
    private func centerImageView(_ imageView: UIImageView, in scrollView: UIScrollView) {
        let offsetX = max((scrollView.bounds.width - scrollView.contentSize.width) * 0.5, 0)
        let offsetY = max((scrollView.bounds.height - scrollView.contentSize.height) * 0.5, 0)
        imageView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX,
                                   y: scrollView.contentSize.height * 0.5 + offsetY)
    }

    private func loadImages() {
        for (i, urlString) in pics.enumerated() {
            let imageScrollView = UIScrollView(frame: CGRect(
                x: CGFloat(i) * view.bounds.width,
                y: 0,
                width: view.bounds.width,
                height: view.bounds.height
            ))
            imageScrollView.minimumZoomScale = 1
            imageScrollView.maximumZoomScale = 3
            imageScrollView.delegate = self
            imageScrollView.showsVerticalScrollIndicator = false
            imageScrollView.showsHorizontalScrollIndicator = false

            // 图片
            let imageView = UIImageView(frame: imageScrollView.bounds)
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            if let url = URL(string: urlString) {
                imageView.kf.setImage(with: url) { result in
                    switch result {
                    case .success(let value):
                        // 图片加载完成后调整 frame
                        let imageSize = value.image.size
                        let scrollSize = imageScrollView.bounds.size
                        let scale = min(scrollSize.width / imageSize.width,
                                        scrollSize.height / imageSize.height)
                        let width = imageSize.width * scale
                        let height = imageSize.height * scale
                        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
                        
                        // 设置 scrollView contentSize
                        imageScrollView.contentSize = CGSize(width: width, height: height)
                        
                        // 居中
                        self.centerImageView(imageView, in: imageScrollView)
                    case .failure(_):
                        break
                    }
                }
            }
            imageScrollView.addSubview(imageView)

            // 双击放大/缩小
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapZoom(_:)))
            doubleTap.numberOfTapsRequired = 2
            imageView.addGestureRecognizer(doubleTap)
            
            // 长按保存
            let longPress = UILongPressGestureRecognizer(
                target: self,
                action: #selector(longPressSave(_:))
            )
            imageView.addGestureRecognizer(longPress)

            scrollView.addSubview(imageScrollView)
        }

        scrollView.contentSize = CGSize(
            width: CGFloat(pics.count) * view.bounds.width,
            height: view.bounds.height
        )
    }

    private func scrollToStartIndex(animated: Bool) {
        scrollView.setContentOffset(
            CGPoint(x: CGFloat(startIndex) * view.bounds.width, y: 0),
            animated: animated
        )
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // 外层分页 scrollView 不缩放
        if scrollView != self.scrollView, let iv = scrollView.subviews.first {
            return iv
        }
        return nil
    }

    @objc private func dismissSelf() {
        dismiss(animated: true)
    }

    @objc private func doubleTapZoom(_ sender: UITapGestureRecognizer) {
        guard let imageScrollView = sender.view?.superview as? UIScrollView,
              let imageView = sender.view as? UIImageView
        else { return }

        let newScale: CGFloat = imageScrollView.zoomScale > 1 ? 1 : 2.5
        imageScrollView.setZoomScale(newScale, animated: true)

        UIView.animate(withDuration: 0.25) {
            self.centerImageView(imageView, in: imageScrollView)
        }
    }
}
