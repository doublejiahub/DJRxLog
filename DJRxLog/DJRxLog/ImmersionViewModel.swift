//
//  ImmersionViewModel.swift
//  DJRxLog
//
//  Created by zhihu on 2021/6/11.
//

import Foundation
import RxSwift
import RxCocoa

class ImmersionViewModel: NSObject {
    
    // PublishSubject 既是观察者, 也是发送者
    let isFollowed = PublishSubject<Bool>()
    
    private var disposeBag = DisposeBag()
    
    init(followTap: Observable<UIButton>) {
        super.init()
        followTap.subscribe { [weak self] (event) in
            //假的网络请求
            let isFollow = event.element?.isSelected ?? false
            print("isFollow: \(isFollow)")
            self?.isFollowed.onNext(!isFollow)
        }.disposed(by: disposeBag)
    }
    
}
