//
//  BAUIView.swift
//  BAUIKit
//
//  Created by Hoang Anh on 20/10/2021.
//

import Foundation
import UIKit

open class BaseUIView: UIView {
    public var onTouchHandler: ((BaseUIView)->())?
    var cornerRadius: CGFloat = 0

    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(self.frame.width/2, self.frame.height/2, self.cornerRadius)
    }

    public convenience init(withConerRadius corner: CGFloat) {
        self.init()
        self.cornerRadius = corner
    }
    
    public init() {
        super.init(frame: .zero)
        self.updateUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateUI() {}
}

extension BaseUIView {
    @discardableResult public func setCorner(radius: CGFloat) -> BaseUIView {
        self.cornerRadius = radius
        return self
    }
}
