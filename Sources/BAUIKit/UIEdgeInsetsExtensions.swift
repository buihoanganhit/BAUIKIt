//
//  UIEdgeInsetsExtensions.swift
//  BAUIKit
//
//  Created by Hoang Anh on 18/10/2021.
//

import Foundation
import UIKit

public extension UIEdgeInsets {
    init(fullEdge constant: CGFloat) {
        self.init(top: constant, left: constant, bottom: constant, right: constant)
    }
}
