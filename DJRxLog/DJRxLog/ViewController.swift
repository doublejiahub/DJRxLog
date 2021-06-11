//
//  ViewController.swift
//  DJRxLog
//
//  Created by zhihu on 2021/5/28.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private lazy var immersionView = ImmersionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(immersionView)
        immersionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}


