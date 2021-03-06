//
//  HighlightController1.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

fileprivate let cellID = "highlight1CellID"

class HighlightController1: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW, height: 120 * kScreenHScale)
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        view.addSubview(collectionView)
    }
    
}

// MARK:-collectionView数据源
extension HighlightController1: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
    }
}

// MARK:-collectionView代理
extension HighlightController1: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let backgroundView = UIView(frame: cell.frame)
        backgroundView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
