//
//  MainTabBarView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class MainTabBarView: UIView{
    
    //MARK: - property
    private let viewBounds = UIScreen.main.bounds
    
    private let backView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var home = UIButton().then {
        $0.setImage(UIImage(named: "Tita-homeBtn"), for: .normal)
    }

    lazy var notice = UIButton().then {
        $0.setImage(UIImage(named: "Tita-noticeBtn"), for: .normal)
    }

    lazy var alarm = UIButton().then {
        $0.setImage(UIImage(named: "Tita-alarmBtn"), for: .normal)
    }

    lazy var myPage = UIButton().then {
        $0.setImage(UIImage(named: "Tita-mypageBtn"), for: .normal)
    }
    
    //MARK: - lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addView
    private func addView(){
        [backView, home, notice, alarm, myPage].forEach { addSubview($0) }
    }
        
    // MARK: - location
    private func location(){
        backView.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width)
            make.height.equalTo(viewBounds.height/13.53)
        }
        
        home.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/18.45)
            make.height.equalTo(viewBounds.height/39.96)
            make.centerY.equalTo(backView)
            make.left.equalTo(viewBounds.width/6.58)
        }
        
        notice.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/15.63)
            make.height.equalTo(viewBounds.height/39.47)
            make.centerY.equalTo(home)
            make.left.equalTo(home.snp.right).offset(viewBounds.width/6.08)
        }
        
        alarm.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/18.75)
            make.height.equalTo(viewBounds.height/40.6)
            make.centerY.equalTo(notice)
            make.left.equalTo(notice.snp.right).offset(viewBounds.width/6.05)
        }
        
        myPage.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/30.17)
            make.height.equalTo(viewBounds.height/46.67)
            make.centerY.equalTo(alarm)
            make.left.equalTo(alarm.snp.right).offset(viewBounds.width/6.05)
        }
    }
}
