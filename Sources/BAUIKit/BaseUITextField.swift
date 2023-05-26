//
//  BaseUITextField.swift
//  BAUIKit
//
//  Created by Hoang Anh on 02/11/2021.
//

import Foundation
import UIKit

open class BaseUITextField: UITextField {
    var cornerRadius: CGFloat = 0
    var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    var limitCharacter: Int = 255
    public var showAlertForLimitCharacter: (()->())?
    public var onTextDidChange: ((String)->())?
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(self.frame.width/2, self.frame.height/2, self.cornerRadius)
    }
    public init() {
        super.init(frame: .zero)
        self.delegate = self
        self.clearButtonMode = .always
        self.addTarget(self, action: #selector(self.onTextEditChange(_:)), for: .editingChanged)
    }
    
    convenience public init(placeholder: String, padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: BaseSize.mediumPadding, bottom: 0, right: BaseSize.mediumPadding)) {
        self.init()
        self.placeholder = placeholder
        self.padding = padding
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: bounds.minX + padding.left, y: bounds.minY + padding.top), size: bounds.size)
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: bounds.minX + padding.left, y: bounds.minY + padding.top), size: bounds.size)
    }
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: bounds.minX + padding.left, y: bounds.minY + padding.top), size: bounds.size)
    }

}

extension BaseUITextField {
    @discardableResult public func setCorner(radius: CGFloat) -> Self {
        self.cornerRadius = radius
        return self
    }

    @discardableResult public func addBottomLine(width: CGFloat, color: UIColor) -> Self {
        let bottomLine: BaseUIView = BaseUIView()
        self.addSubviews([bottomLine])
        bottomLine.setBackground(color: color)
        bottomLine
            .setHeight(constant: width)
            .setLeading()
            .setTrailing()
            .setBottom()
        self.clipsToBounds = true
        return self
    }
    
    @discardableResult public func setLimitCharacter(limit: Int) -> Self {
        self.limitCharacter = limit
        return self
    }
}

extension BaseUITextField: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = self.text, let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false}
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        if count > self.limitCharacter {
            self.showAlertForLimitCharacter?()
        }
        return count <= self.limitCharacter
    }
    
    @objc private func onTextEditChange(_ sender: UITextField) {
        self.onTextDidChange?(sender.text ?? "")
    }
}
