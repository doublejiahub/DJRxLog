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
    private var disposeBag = DisposeBag()
    private var viewModel: ImmersionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(immersionView)
        immersionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
                
        viewModel = ImmersionViewModel(followTap: immersionView.rx.followTap)
        viewModel!.isFollowed.bind(to: immersionView.rx.isFollow).disposed(by: disposeBag)
    }
    
}


