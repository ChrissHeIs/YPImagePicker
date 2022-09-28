//
//  YPLibraryVCManageLimitHeader.swift
//  YPImagePicker
//
//  Created by Pavlo Shestak on 27.09.2022.
//  Copyright © 2022 Yummypets. All rights reserved.
//

import Foundation
import UIKit

class YPLibraryVCManageLimitHeader: UICollectionReusableView {
    
    var action: ()->Void = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let button = UIButton(frame: frame)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[button]-0-|", metrics: nil, views: ["button" : button]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[button]-0-|", metrics: nil, views: ["button" : button]))
        
        button.setTitle("Select more...", for: .normal)
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "photo.on.rectangle.angled"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        button.addTarget(self, action: #selector(YPLibraryVCManageLimitHeader.moreImagesButtonTapped), for: .touchUpInside)
        button.setTitleColor(YPImagePickerConfiguration.shared.colors.bottomMenuItemUnselectedTextColor, for: .normal)
        button.tintColor = YPImagePickerConfiguration.shared.colors.bottomMenuItemUnselectedTextColor
    }
    
    @objc func moreImagesButtonTapped() {
        action()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
