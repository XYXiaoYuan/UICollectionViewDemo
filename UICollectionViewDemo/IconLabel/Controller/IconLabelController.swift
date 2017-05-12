//
//  IconLabelController.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

fileprivate let cellID = "iconLabelCellID"

class IconLabelController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        var rect = self.view.frame
        
        let layout = UICollectionViewFlowLayout()
        let width = layout.fixSlit(rect: &rect, colCount: 2, space: 1)
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.headerReferenceSize = CGSize(width: rect.width, height: 180 * kScreenHScale)
        
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        
        collectionView.register(IconLabelCell.self, forCellWithReuseIdentifier: cellID)
        view.addSubview(collectionView)
        
        var x: CGFloat = 0
        
        for i in 0..<4 {
            let iconLabel = IconLabel()
            iconLabel.direction = IconDirection(rawValue: i)!
            iconLabel.edgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
            iconLabel.set("知乎", with: UIImage(named: "icon"))
            iconLabel.frame.origin = CGPoint(x: x, y: 20)
            x = iconLabel.frame.maxX + 20
            collectionView.addSubview(iconLabel)
        }
    }
    
    let directions: [NSLayoutAttribute] = [
        .top,
        .bottom,
        .left,
        .right
    ]
}

// MARK:-collectionView数据源
extension IconLabelController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
    }
}

// MARK:-collectionView代理
extension IconLabelController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? IconLabelCell)?.direction = directions[indexPath.row % 4]
        cell.backgroundColor = UIColor.groupTableViewBackground
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

