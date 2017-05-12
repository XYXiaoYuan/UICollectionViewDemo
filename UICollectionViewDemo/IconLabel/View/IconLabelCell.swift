//
//  IconLabelCell.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

class IconLabelCell: UICollectionViewCell {
    
    var direction: NSLayoutAttribute? {
        didSet {
            if let direction = direction {
                button.set("知乎", with: UIImage(named: "icon"), direction: direction)
            }
        }
    }
    
    private lazy var button: UIButton = {
        return UIButton(frame: self.bounds)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.isUserInteractionEnabled = false
        //        button.isEnabled = false 设置这个也可以，但是颜色会有偏移
        contentView.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("没有在xib中加载")
    }
}

