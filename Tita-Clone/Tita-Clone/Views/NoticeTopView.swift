//
//  NoticeTopView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/14.
//

import UIKit
import SwiftUI

class NoticeTopView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    let prevButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-PrevButton"), for: .normal)
    }

    private let title = UILabel().then {
        $0.text = "자유게시판"
        $0.dynamicFont(fontSize: 22, currentFontName: "NotoSans-Bold")
    }
    
    private let headView = UIView().then {
        $0.backgroundColor = .rgba(red: 167, green: 203, blue: 234, alpha: 1)

    }
    
// MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
        
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
        
    // MARK: - addView
    private func addView(){
        [prevButton, title, headView].forEach { addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        prevButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/53.27)
            make.height.equalTo(viewBounds.height/45.16)
            make.left.equalTo(viewBounds.width/13.89)
            make.top.equalTo(viewBounds.height/13.04)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(prevButton)
            make.left.equalTo(prevButton.snp.right).offset(viewBounds.width/24.85)
        }
        
        headView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(viewBounds.height/203)
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/55.62)
            make.centerX.equalToSuperview()
        }
    }
}
