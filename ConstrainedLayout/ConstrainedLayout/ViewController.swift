//
//  ViewController.swift
//  ConstrainedLayout
//
//  Created by wangyahui on 2021/3/29.
//

import UIKit

let kScreenScale     = UIScreen.main.scale
let kScreenWidth     = UIScreen.main.bounds.size.width
let kScreenHeight    = UIScreen.main.bounds.size.height

let kStatusBarHeight = UIApplication.shared.statusBarFrame.height
let kNavBarHeight    = kStatusBarHeight + 44
let kTabBarHeight    = UISafeAreaInset().bottom + 50
let kBottomHeight    = UISafeAreaInset().bottom

func UISafeAreaInset() -> UIEdgeInsets {
    if #available(iOS 11, *) {
        return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero;
    }
    return .zero
}

class ViewController: UIViewController {

    let identifier = String(describing: TestTableViewCell.self)

    var dataArray = [
        ["left":"左边比较短", "center":"中间比较短", "right":"右边比较短"],
        ["left":"左边比较短", "center":"中间比较长中间比", "right":"右边比较长右边比较长"],
        ["left":"左边比较长左边比较长左边比较长", "center":"中间比较短", "right":"右边比较短"],
        ["left":"左边比较长左边比较长左边比较长长左边比左边比较长左边比较长左边比较长长左边比", "center":"中间比较长中间比较长中间比较长", "right":"右边比较长右边比较长右边比较长右边比较长右边比较长右边比较长"],
    ]
    
    lazy var tableView: UITableView = {
        let tableview = UITableView.init(frame: CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kScreenHeight - kStatusBarHeight), style: .plain)
        tableview.separatorStyle = .none
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(tableView)
        
        
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TestTableViewCell
        let model = dataArray[indexPath.row]
        cell.configData(model["left"]!, center: model["center"]!, right: model["right"]!)
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
}
