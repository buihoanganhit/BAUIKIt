//
//  File.swift
//  
//
//  Created by Hoang Anh on 24/05/2023.
//

import Foundation
import UIKit

//MARK: - Constraint Layout
extension UIView {
    func getConstraintWithIdentifier(_ id: String) -> NSLayoutConstraint? {
        return self.constraints.filter { $0.identifier == id}.first
    }
    

    @discardableResult public func setTop(constant: CGFloat = 0, isSafeArea: Bool = false, isUpdate: Bool = false) -> Self {
        let id: String = #function
        guard let superView = self.superview else {return self}
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var _topAnchor: NSLayoutConstraint
            if isSafeArea {
                _topAnchor = self.topAnchor.constraint(equalTo: superView.layoutMarginsGuide.topAnchor, constant: constant)
            } else {
                _topAnchor = self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant)
            }
            _topAnchor.identifier = id
            _topAnchor.isActive = true
        }
        return self
    }
    

    @discardableResult public func setBottom(constant: CGFloat = 0, isSafeArea: Bool = false, isUpdate: Bool = false) -> Self {
        let id: String = #function
        guard let superView = self.superview else {return self}
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = -constant
            self.layoutIfNeeded()
        } else {
            var _bottomAnchor: NSLayoutConstraint
            if isSafeArea {
                _bottomAnchor = self.bottomAnchor.constraint(equalTo: superView.layoutMarginsGuide.bottomAnchor, constant: -constant)
            } else {
                _bottomAnchor = self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -constant)
            }
            _bottomAnchor.identifier = id
            _bottomAnchor.isActive = true
        }
        return self
    }


    @discardableResult public func setLeading(constant: CGFloat = 0, isSafeArea: Bool = false, isUpdate: Bool = false) -> Self {
        let id: String = #function
        
        guard let superView = self.superview else {return self}
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
//            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
            var _leadingAnchor: NSLayoutConstraint
            if isSafeArea {
                _leadingAnchor = self.leadingAnchor.constraint(equalTo: superView.layoutMarginsGuide.leadingAnchor, constant: constant)
            } else {
                _leadingAnchor = self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant)
            }
            _leadingAnchor.identifier = id
            _leadingAnchor.isActive = true
        }
        return self
    }

    @discardableResult public func setTrailing(constant: CGFloat = 0, isSafeArea: Bool = false, isUpdate: Bool = false) -> Self {
        let id: String = #function
        guard let superView = self.superview else {return self}
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = -constant
            self.layoutIfNeeded()
        } else {
//            self.leadingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant).isActive = true
            var _trailingAnchor: NSLayoutConstraint
            if isSafeArea {
                _trailingAnchor = self.leadingAnchor.constraint(equalTo: superView.layoutMarginsGuide.trailingAnchor, constant: -constant)
            } else {
                _trailingAnchor = self.leadingAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant)
            }
            _trailingAnchor.identifier = id
            _trailingAnchor.isActive = true
        }
        return self
    }

    @discardableResult public func setCenterX(constant: CGFloat = 0, isUpdate: Bool = false) -> Self {
        let id: String = #function
        guard let superView = self.superview else {return self}
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var _centerXAnchor: NSLayoutConstraint
            _centerXAnchor = self.centerXAnchor.constraint(equalTo: superView.trailingAnchor, constant: constant)
            _centerXAnchor.identifier = id
            _centerXAnchor.isActive = true
        }
        return self
    }

    @discardableResult public func setCenterY(constant: CGFloat = 0, isUpdate: Bool = false) -> Self {
        let id: String = #function
        guard let superView = self.superview else {return self}
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var _centerYAnchor: NSLayoutConstraint
            _centerYAnchor = self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: constant)
            _centerYAnchor.identifier = id
            _centerYAnchor.isActive = true
        }
        return self
    }

    @discardableResult public func setFullConstraint(constant: CGFloat = 0) -> UIView {
        self.setTop(constant: constant).setLeading(constant: constant).setTrailing(constant: constant).setBottom(constant: constant)
        return self
    }

    // with itSelf
    @discardableResult public func setWidth(constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id: String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var _widthAnchor: NSLayoutConstraint
            _widthAnchor = self.widthAnchor.constraint(equalToConstant: constant)
            _widthAnchor.identifier = id
            _widthAnchor.isActive = true
        }
        return self
    }

    @discardableResult public func setHeight(constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id: String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var _heightAnchor: NSLayoutConstraint
            _heightAnchor = self.heightAnchor.constraint(equalToConstant: constant)
            _heightAnchor.identifier = id
            _heightAnchor.isActive = true
        }
        return self
    }

    @discardableResult public func setWidthEqualHeight(multiplier: CGFloat = 1) -> Self {
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult public func setHeightEqualWidth(multiplier: CGFloat = 1) -> Self {
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier).isActive = true
        return self
    }

    // with otherView
    @discardableResult public func setTop(underView view: UIView, constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id: String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var layoutConstraint: NSLayoutConstraint
            layoutConstraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            layoutConstraint.identifier = id
            layoutConstraint.isActive = true
        }
        return self
    }

    @discardableResult public func setBottom(aboveView view: UIView ,constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id:String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var layoutConstraint: NSLayoutConstraint
            layoutConstraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant)
            layoutConstraint.identifier = id
            layoutConstraint.isActive = true
        }
        return self
    }

    @discardableResult public func setLeading(afterView view: UIView ,constant: CGFloat, isUpdate: Bool) -> Self {
        let id:String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var layoutConstraint: NSLayoutConstraint
            layoutConstraint = self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
            layoutConstraint.identifier = id
            layoutConstraint.isActive = true
        }
        return self
    }

    @discardableResult public func setTrailing(beforeView view: UIView ,constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id:String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var layoutConstraint: NSLayoutConstraint
            layoutConstraint = self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
            layoutConstraint.identifier = id
            layoutConstraint.isActive = true
        }
        return self
    }

    @discardableResult public func setCenterX(equalTo view: UIView ,constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id:String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var layoutConstraint: NSLayoutConstraint
            layoutConstraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
            layoutConstraint.identifier = id
        }
        return self
    }

    @discardableResult public func setCenterY(equalTo view: UIView ,constant: CGFloat, isUpdate: Bool = false) -> Self {
        let id:String = #function
        if isUpdate {
            self.getConstraintWithIdentifier(id)?.constant = constant
            self.layoutIfNeeded()
        } else {
            var layoutConstraint: NSLayoutConstraint
            layoutConstraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
            layoutConstraint.identifier = id
        }
        return self
    }

    @discardableResult public func setWidth(otherView: UIView? = nil, multiplier: CGFloat = 1) -> Self {
        if let otherView = otherView {
            self.widthAnchor.constraint(equalTo: otherView.widthAnchor, multiplier: multiplier).isActive = true
        } else if let superView = self.superview {
            self.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: multiplier).isActive = true
        }
        return self
    }

    @discardableResult public func setHeight(_ otherView: UIView? = nil, multiplier: CGFloat = 1) -> Self {
        if let otherView = otherView {
            self.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: multiplier).isActive = true
            return self
        } else if let superView = self.superview {
            self.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: multiplier).isActive = true
        }
        return self
    }
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
