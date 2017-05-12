//
//  MainViewController.swift
//  UICollectionViewDemo
//
//  Created by 袁小荣 on 2017/5/12.
//  Copyright © 2017年 袁小荣. All rights reserved.
//

import UIKit

fileprivate let cellID = "mainCellID"

class MainViewController: UIViewController {
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var data: [[UIViewController.Type]] = [
        [
            GapController.self,
            NoGapController.self
        ],
        [
            DebugGapController.self,
            DebugNoGapController.self
        ],
        [
            HighlightController1.self,
            HighlightController2.self
        ],
        [
            IconLabelController.self
        ],
        [
            LayoutController.self
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "collectionView"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
    }
}

// MARK:-tableView数据源
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    }
}

// MARK:-tableView代理
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = "\(data[indexPath.section][indexPath.row].classForCoder())"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let controllerName = "\(data[indexPath.section][indexPath.row].classForCoder())"
        if let controller = controllerName.fromClassName() as? UIViewController {
            controller.title = controllerName
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

// MARK:-String扩展,拼接
extension String {
    func fromClassName() -> NSObject {
        let className = Bundle.main.infoDictionary!["CFBundleName"] as! String + "." + self
        let aClass = NSClassFromString(className) as! UIViewController.Type
        return aClass.init()
    }
}

