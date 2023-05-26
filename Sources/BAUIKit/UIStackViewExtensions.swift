//
//  UIStackViewExtensions.swift
//  BAUIKit
//
//  Created by Hoang Anh on 21/10/2021.
//

import Foundation
import UIKit

public extension UIStackView {
    @discardableResult func addArrangedSubview(_ views: [UIView]) -> Self {
        views.forEach({self.addArrangedSubview($0)})
        return self
    }
}
