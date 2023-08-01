//
//  CircleImageView.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

final class CircleImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
