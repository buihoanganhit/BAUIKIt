//
//  BaseUIButton.swift
//  BAUIKit
//
//  Created by Hoang Anh on 01/11/2021.
//

import Foundation
import UIKit

open class BaseUIButton: UIButton {
    var cornerRadius: CGFloat = 0

    public var onTouchHandler: ((BaseUIButton)->())?
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(self.frame.width/2, self.frame.height/2, self.cornerRadius)
    }
    public init() {
        super.init(frame: .zero)
        self.setTouchView()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(text: String, textColor: UIColor, backgroundColor: UIColor) {
        self.init()
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
    }
}
extension BaseUIButton{
    @discardableResult public func setCorner(radius: CGFloat) -> BaseUIButton {
        self.cornerRadius = radius
        return self
    }
    
    override internal func onTouchView() {
        self.addTouchAnimation(type: .Scale(0.98, 0.98))
        self.onTouchHandler?(self)
    }
}
