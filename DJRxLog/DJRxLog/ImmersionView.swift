//
//  ImmersionView.swift
//  DJRxLog
//
//  Created by zhihu on 2021/6/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ImmersionView: UIView {
    
    fileprivate lazy var followButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(), for: .selected)
        btn.adjustsImageWhenHighlighted = false
        btn.setTitle("+ 关注", for: .normal)
        btn.setTitle("已关注", for: .selected)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.cornerRadius = 6
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(followButton)
        followButton.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(100)
            make.size.equalTo(CGSize(width: 80, height: 30))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Reactive where Base: ImmersionView {
    
    var followTap: Observable<UIButton> {
        return base.followButton.rx.tap.map { _ in base.followButton }.asObservable()
    }
    
}

