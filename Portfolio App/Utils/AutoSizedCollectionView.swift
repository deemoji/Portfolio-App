//
//  AutoSizedCollectionView.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

class AutoSizedCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
