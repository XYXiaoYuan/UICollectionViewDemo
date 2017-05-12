//
//  UICollectionViewFlowLayout+Extension.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

// MARK:-修正collection布局有缝隙
extension UICollectionViewFlowLayout {
    
    /// collectionView布局整队除不尽造成缝隙
    ///
    /// - Parameters:
    ///   - rect: collectionView的Rect
    ///   - colCount: 列数
    ///   - space: 每列的间距
    /// - Returns: collectionViewCell的宽度
    func fixSlit(rect: inout CGRect, colCount: CGFloat, space: CGFloat = 0) -> CGFloat {
        let totalSpace = (colCount - 1) * space
        let itemWidth = (rect.width - totalSpace) / colCount
        let fixValue = 1 / kScreenScale
        var realItemWidth = floor(itemWidth) + fixValue
        if realItemWidth < itemWidth {
            realItemWidth += fixValue
        }
        let realWidth = colCount * realItemWidth + totalSpace
        let pointX = (realWidth - rect.width) / 2
        rect.origin.x = -pointX
        rect.size.width = realWidth
        return (rect.width - totalSpace) / colCount
    }
}
