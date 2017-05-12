//
//  DebugGapController.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

fileprivate let cellID = "debugGapCellID"

class DebugGapController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        var rect = self.view.frame
        
        let layout = UICollectionViewFlowLayout()
        // 修复宽度
        let width = layout.fixSlit(rect: &rect, colCount: 4, space: 1)
        layout.itemSize = CGSize(width: width, height: 88 * kScreenHScale)
        
        // UICollectionViewFlowLayout的minimumLineSpacing和minimumInteritemSpacing默认值是10.0,为不让它不影响我们的布局,我们把默认值修改为0
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        view.addSubview(collectionView)
    }
}

// MARK:-collectionView数据源
extension DebugGapController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
    }
}

// MARK:-collectionView代理
extension DebugGapController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let white = CGFloat(indexPath.row) / 20.0
        cell.backgroundColor = UIColor(white: white, alpha: 1.0)
    }
}
