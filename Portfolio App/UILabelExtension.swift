//
//  UILabelExtension.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

extension UILabel {
    func text(with image: UIImage?, _ text: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        let imageOffsetY: CGFloat = -2.0
        if let image = imageAttachment.image {
            imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: image.size.width, height: image.size.height)
        }
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        let attributedText = NSAttributedString(string: text)
        completeText.append(attributedText)
        self.textAlignment = .center
        self.attributedText = completeText
    }
}
