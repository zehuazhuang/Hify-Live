//
//  ZzMfsLWAvVQk9B.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/31.
//

import SwiftUI

struct NoResignTextField: UIViewRepresentable {
    @Binding var text: String
    var isFocused: FocusState<Bool>.Binding
    var onSend: (() -> Void)?   // 发送闭包

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.text = text
        textField.font = JqA1kUIFont.font(size: 14, weight: .regular)
        textField.textColor = UIColor.white
        textField.returnKeyType = .send
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.addTarget(context.coordinator,
                            action: #selector(Coordinator.textChanged(_:)),
                            for: .editingChanged)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if isFocused.wrappedValue && !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: NoResignTextField
        init(_ parent: NoResignTextField) { self.parent = parent }

        @objc func textChanged(_ sender: UITextField) {
            parent.text = sender.text ?? ""
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // 按键盘 send 时只触发发送逻辑
            parent.onSend?()
            return false // 不收起键盘
        }
    }
}
