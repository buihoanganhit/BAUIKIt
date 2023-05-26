//
//  BaseUILabel.swift
//  BAUIKit
//
//  Created by Hoang Anh on 30/10/2021.
//

import Foundation
import UIKit

open class BaseUILabel: UILabel {
    public enum TYPE {
        case SUPER_HEADER
        case HEADER
        case TITLE
        case SUB_TITLE
        case SUB_SUB_TITLE
        
        var getSize: CGFloat {
            switch self {
            case .SUPER_HEADER:
                return BaseFont.super_header
            case .HEADER:
                return BaseFont.header
            case .TITLE:
                return BaseFont.title
            case .SUB_TITLE:
                return BaseFont.sub_title
            case .SUB_SUB_TITLE:
                return BaseFont.sub_sub_title
            }
        }
    }

    public var cornerRadius: CGFloat = 0
    
    public var fontType: TYPE = .TITLE
    
    public var edgeInset: UIEdgeInsets = .zero
    
    public var onTouchHandler: ((BaseUILabel)->())?
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(self.cornerRadius, self.frame.size.height/2, self.frame.size.width/2)
    }
    
    public init() {
        super.init(frame: .zero)
        self.setTouchView()
    }
    
    public convenience init(type: TYPE, text: String = "", color: UIColor = .black, textAlignment: NSTextAlignment = .left, edgeInset: UIEdgeInsets = .zero) {
        self.init()
        self.font = UIFont.systemFont(ofSize: type.getSize)
        self.text = text
        self.textColor = color
        self.textAlignment = textAlignment
        self.fontType = type
        self.edgeInset = edgeInset
        self.setEdgeInsets(edge: edgeInset)
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func drawText(in rect: CGRect) {
        let inset = CGRect(x: rect.minX + self.edgeInset.left, y: rect.minY + self.edgeInset.top, width: rect.size.width - self.edgeInset.left - self.edgeInset.right, height: rect.size.height - self.edgeInset.top - self.edgeInset.bottom)
        super.drawText(in: inset)
    }

    open override var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize
        intrinsicContentSize.width += self.edgeInset.left + self.edgeInset.right
        intrinsicContentSize.height += self.edgeInset.top + self.edgeInset.bottom
        return intrinsicContentSize
    }
}

extension BaseUILabel {
    @discardableResult public func setText(text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult public func setTextAttibuted(attribute: NSMutableAttributedString) -> Self {
        self.attributedText = attribute
        return self
    }
    
    @discardableResult public func setMultiline(numbers: Int) -> Self {
        self.numberOfLines = numbers
        return self
    }
    
    @discardableResult public func setBold() -> Self {
        self.font = UIFont.boldSystemFont(ofSize: self.fontType.getSize)
        return self
    }
    
    @discardableResult public func setEdgeInsets(edge: UIEdgeInsets) -> Self {
        self.edgeInset = edge
        return self
    }
    
    @discardableResult public func setTextColor(color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult public func setCorner(corner: CGFloat) -> Self {
        self.cornerRadius = corner
        return self
    }
    
    @discardableResult public func setBackgroundBouned(color: UIColor) -> Self {
        self.layer.backgroundColor = color.cgColor
        return self
    }
}

extension BaseUILabel {
    @objc override internal func onTouchView() {
        self.addTouchAnimation(type: .Scale(0.98, 0.98))
        self.onTouchHandler?(self)
    }
}
