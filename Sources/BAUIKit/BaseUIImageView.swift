//
//  BaseUIImageView.swift
//  BAUIKit
//
//  Created by Hoang Anh on 04/11/2021.
//

import Foundation
import UIKit

open class BaseUIImageView: UIImageView {
    public var onTouchHandler: ((BaseUIImageView)->())?
    
    override public init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
//        self.setTouchView()
    }
    
    convenience public init(imageName: String, contentMode: ContentMode = .scaleAspectFit, highlightedImageName: String = "") {
        self.init(image: UIImage(named: imageName), highlightedImage: UIImage(named: highlightedImageName))
        self.contentMode = contentMode
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseUIImageView {
//    override internal func onTouchView() {
//        self.addTouchAnimation(type: .Shaking(-3, -3))
//        self.onTouchHandler?(self)
//    }
//
    @discardableResult public func setCorner(radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
}
