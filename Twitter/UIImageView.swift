//
//  UIImageView.swift
//  Twitter
//
//  Created by Amanda Jackson on 2/19/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
