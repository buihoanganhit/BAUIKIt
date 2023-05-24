//
//  File.swift
//  
//
//  Created by Hoang Anh on 24/05/2023.
//

import Foundation
import UIKit

public protocol BaseUIViewPresent {
    var topConstraintLayout: NSLayoutConstraint? {get set}
    var leadingConstraintLayout: NSLayoutConstraint? {get set}
    var trailingConstraintLayout: NSLayoutConstraint? {get set}
    var bottomConstraintLayout: NSLayoutConstraint? {get set}
    var centerXContraintLayout: NSLayoutConstraint? {get set}
    var centerYConstraintLayout: NSLayoutConstraint? {get set}
    var widthConstraintLayout: NSLayoutConstraint? {get set}
    var heightConstraintLayout: NSLayoutConstraint? {get set}
}

extension BaseUIViewPresent {
    public var topConstraintLayout: NSLayoutConstraint? {
        get { return self.topConstraintLayout }
        set { self.topConstraintLayout = newValue }
    }
    
    public var leadingConstraintLayout: NSLayoutConstraint? {
        get { self.leadingConstraintLayout }
        set { self.leadingConstraintLayout = newValue}
    }
    
    public var trailingConstraintLayout: NSLayoutConstraint? {
        get { self.trailingConstraintLayout }
        set { self.trailingConstraintLayout = newValue}
    }
    
    public var bottomConstraintLayout: NSLayoutConstraint? {
        get { self.bottomConstraintLayout }
        set { self.bottomConstraintLayout = newValue }
    }
    public var centerXContraintLayout: NSLayoutConstraint? {
        get { self.centerXContraintLayout }
        set { self.centerYConstraintLayout = newValue }
    }
    public var centerYConstraintLayout: NSLayoutConstraint? {
        get { self.centerYConstraintLayout }
        set { self.centerYConstraintLayout = newValue}
    }
    public var widthConstraintLayout: NSLayoutConstraint? {
        get { self.widthConstraintLayout }
        set { self.widthConstraintLayout = newValue }
    }
    public var heightConstraintLayout: NSLayoutConstraint? {
        get { self.heightConstraintLayout }
        set { self.heightConstraintLayout = newValue }
    }
}

extension BaseUIViewPresent where Self: UIView {
    @discardableResult public mutating func setTop(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.topConstraintLayout = self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant)
        self.topConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setSafeAreaTop(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.topConstraintLayout = self.topAnchor.constraint(equalTo: superView.layoutMarginsGuide.topAnchor, constant: constant)
        self.topConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setBottom(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.bottomConstraintLayout = self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -constant)
        self.bottomConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setSafeAreaBottom(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.bottomConstraintLayout = self.bottomAnchor.constraint(equalTo: superView.layoutMarginsGuide.bottomAnchor, constant: -constant)
        self.bottomConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setLeading(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.leadingConstraintLayout = self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant)
        self.leadingConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setTrailing(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.trailingConstraintLayout = self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -constant)
        self.trailingConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setCenterX(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.centerXContraintLayout = self.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: constant)
        self.centerXContraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setCenterY(constant: CGFloat = 0) -> Self {
        guard let superView = self.superview else {return self}
        self.centerYConstraintLayout = self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: constant)
        self.centerYConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setFullConstraint(constant: CGFloat = 0) -> UIView {
        self.setTop(constant: constant)
        self.setLeading(constant: constant)
        self.setTrailing(constant: constant)
        self.setBottom(constant: constant)
        return self
    }
    
    @discardableResult public mutating func setSafeAreaFullConstraint(constant: CGFloat = 0) -> Self {
        self.setSafeAreaTop(constant: constant)
        self.setLeading(constant: constant)
        self.setTrailing(constant: constant)
        self.setSafeAreaBottom(constant: constant)
        return self
    }
    
    // with itSelf
    @discardableResult public mutating func setWidth(constant: CGFloat) -> Self {
        self.widthConstraintLayout = self.widthAnchor.constraint(equalToConstant: constant)
        self.widthConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setHeight(constant: CGFloat) -> Self {
        self.heightConstraintLayout = self.heightAnchor.constraint(equalToConstant: constant)
        self.heightConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setWidthEqualHeight(multiplier: CGFloat = 1) -> Self {
        self.widthConstraintLayout = self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier)
        self.widthConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setHeightEqualWidth(multiplier: CGFloat = 1) -> Self {
        self.heightConstraintLayout = self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier)
        self.heightConstraintLayout?.isActive = true
        return self
    }
    
    // with otherView
    @discardableResult public mutating func setTop(underView view: UIView ,constant: CGFloat) -> Self {
        self.topConstraintLayout = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        self.topConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setBottom(aboveView view: UIView ,constant: CGFloat) -> Self {
        self.bottomConstraintLayout = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -constant)
        self.bottomConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setLeading(afterView view: UIView ,constant: CGFloat) -> Self {
        self.leadingConstraintLayout = self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
        self.leadingConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setTrailing(beforeView view: UIView ,constant: CGFloat) -> Self {
        self.trailingConstraintLayout = self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant)
        self.trailingConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setCenterX(equalTo view: UIView ,constant: CGFloat) -> Self {
        self.centerXContraintLayout = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        self.centerXContraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setCenterY(equalTo view: UIView ,constant: CGFloat) -> Self {
        self.centerYConstraintLayout = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        self.centerYConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setWidth(otherView: UIView? = nil, multiplier: CGFloat = 1) -> Self {
        if let otherView = otherView {
            self.widthConstraintLayout = self.widthAnchor.constraint(equalTo: otherView.widthAnchor, multiplier: multiplier)
        } else if let superView = self.superview {
            self.widthConstraintLayout = self.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: multiplier)
        }
        self.widthConstraintLayout?.isActive = true
        return self
    }
    
    @discardableResult public mutating func setHeight(_ otherView: UIView? = nil, multiplier: CGFloat = 1) -> Self {
        if let otherView = otherView {
            self.heightConstraintLayout = self.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: multiplier)
        } else if let superView = self.superview {
            self.heightConstraintLayout = self.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: multiplier)
        }
        self.heightConstraintLayout?.isActive = true
        return self
    }
}
//MARK: - Constraint Layout
extension UIView {
    // with superView
//    @discardableResult public func setTop(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setSafeAreaTop(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.topAnchor.constraint(equalTo: superView.layoutMarginsGuide.topAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setBottom(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setSafeAreaBottom(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.bottomAnchor.constraint(equalTo: superView.layoutMarginsGuide.bottomAnchor, constant: -constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setLeading(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setTrailing(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setCenterX(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setCenterY(constant: CGFloat = 0) -> Self {
//        guard let superView = self.superview else {return self}
//        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setFullConstraint(constant: CGFloat = 0) -> UIView {
//        self.setTop(constant: constant).setLeading(constant: constant).setTrailing(constant: constant).setBottom(constant: constant)
//        return self
//    }
//
//    @discardableResult public func setSafeAreaFullConstraint(constant: CGFloat = 0) -> Self {
//        self.setSafeAreaTop(constant: constant).setLeading(constant: constant).setTrailing(constant: constant).setSafeAreaBottom(constant: constant)
//        return self
//    }
//
//    // with itSelf
//    @discardableResult public func setWidth(constant: CGFloat) -> Self {
//        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setHeight(constant: CGFloat) -> Self {
//        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setWidthEqualHeight(multiplier: CGFloat = 1) -> Self {
//        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier).isActive = true
//        return self
//    }
//
//    @discardableResult public func setHeightEqualWidth(multiplier: CGFloat = 1) -> Self {
//        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier).isActive = true
//        return self
//    }
//
//    // with otherView
//    @discardableResult public func setTop(underView view: UIView ,constant: CGFloat) -> Self {
//        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setBottom(aboveView view: UIView ,constant: CGFloat) -> Self {
//        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setLeading(afterView view: UIView ,constant: CGFloat) -> Self {
//        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setTrailing(beforeView view: UIView ,constant: CGFloat) -> Self {
//        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setCenterX(equalTo view: UIView ,constant: CGFloat) -> Self {
//        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setCenterY(equalTo view: UIView ,constant: CGFloat) -> Self {
//        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
//        return self
//    }
//
//    @discardableResult public func setWidth(otherView: UIView? = nil, multiplier: CGFloat = 1) -> Self {
//        if let otherView = otherView {
//            self.widthAnchor.constraint(equalTo: otherView.widthAnchor, multiplier: multiplier).isActive = true
//        } else if let superView = self.superview {
//            self.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: multiplier).isActive = true
//        }
//        return self
//    }
//
//    @discardableResult public func setHeight(_ otherView: UIView? = nil, multiplier: CGFloat = 1) -> Self {
//        if let otherView = otherView {
//            self.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: multiplier).isActive = true
//            return self
//        } else if let superView = self.superview {
//            self.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: multiplier).isActive = true
//        }
//        return self
//    }
}
//MARK: - Funcs Helper
public extension UIView {
    
    @discardableResult func addSubviews(_ views: [UIView]) -> UIView {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        return self
    }

    @discardableResult func setBackground(color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult func addBorder(width: CGFloat, color: UIColor) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    @discardableResult func addShadow(radius: CGFloat, offset: CGSize, opacity: Float, color: UIColor) -> Self {
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        self.clipsToBounds = false
        return self
    }
    
    @discardableResult func addTouchAnimation(type: TouchAnimationType) -> Self {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 20, options: .curveEaseInOut) {
            switch type {
            case .Scale(let x, let y):
                self.transform = CGAffineTransform(scaleX: x, y: y)
            case .Shaking(let x, let y):
                self.transform = CGAffineTransform.init(translationX: x, y: y)
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseOut) {
                switch type {
                case .Scale(_,_):
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                case .Shaking:
                    self.transform = CGAffineTransform.init(translationX: 0, y: 0)
                }
            }
        }
        return self
    }
    @discardableResult func setTouchView() -> Self {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onTouchView)))
        return self
    }
}
extension UIView {
    @objc func onTouchView() {}
}
public enum TouchAnimationType {
    case Scale(_ x: CGFloat,_ y: CGFloat)
    case Shaking(_ x: CGFloat,_ y: CGFloat)
}
