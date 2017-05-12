//
//  LayoutController.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

class LayoutController: UIViewController {
    
    fileprivate lazy var redView: UIView = {
        let redView = UIView()
        return redView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupUI()
    }
}

// MARK:-私有方法
extension LayoutController {
    func setupUI() {
        // 添加红色View
        addRedView()
        
        // 添加蓝色View
        addBlueView()
    }
    
    func addRedView() {
        view.addSubview(self.redView)
        redView.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let height1 = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 200)
        let width1 = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 200)
        
        let centerX = NSLayoutConstraint(item: redView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: redView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        redView.addConstraints([height1, width1])
        redView.superview!.addConstraints([centerX, centerY])
    }
    
    func addBlueView() {
        /*
         NSLayoutAttributeLeading
         在习惯由左向右看的地区，相当于NSLayoutAttributeLeft。在习惯从右至左看的地区，相当于NSLayoutAttributeRight
         
         NSLayoutAttributeTrailing
         在习惯由左向右看的地区，相当于NSLayoutAttributeRight。在习惯从右至左看的地区，相当于NSLayoutAttributeLeft
         
         */
        
        let blueView = UIView()
        blueView.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        view.addSubview(blueView)//系统默认会给autoresizing 约束
        // 关闭autoresizing 不关闭否则程序崩溃
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        //宽度约束
        let width = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy:.equal, toItem:nil, attribute: .notAnAttribute, multiplier:0.0, constant:200)
        
        blueView.addConstraint(width)//自己添加约束
        
        //高度约束
        let height = NSLayoutConstraint(item: blueView, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier:0.0, constant:200)
        
        blueView.addConstraint(height)//自己添加约束
        
        //右边约束
        let right = NSLayoutConstraint(item: blueView, attribute: .centerX, relatedBy:.equal, toItem: view, attribute: .centerX, multiplier:1.0, constant: 0)
        
        blueView.superview!.addConstraint(right)//父控件添加约束
        
        //下边约束
        let bottom = NSLayoutConstraint(item: blueView, attribute: .top, relatedBy:.equal, toItem:redView, attribute: .bottom, multiplier:1.0, constant: 20)
        
        blueView.superview!.addConstraint(bottom)
    }
}
