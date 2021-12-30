//
//  MainTopView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/13.
//

import UIKit

class MainTopView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    private let headLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고"
        $0.dynamicFont(fontSize: 22, currentFontName: "NotoSans-Bold")
    }
    
    private let headView = UIView().then {
        $0.backgroundColor = .rgba(red: 167, green: 203, blue: 234, alpha: 1)

    }
    
    let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-Search"), for: .normal)
    }
    
    let myPageButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-Mypage"), for: .normal)
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
            [headLabel, headView, searchButton, myPageButton].forEach { addSubview($0) }
        }
            
        // MARK: - location
        private func location(){
            headLabel.snp.makeConstraints { make in
                make.top.equalTo(viewBounds.height/14.25)
                make.left.equalTo(viewBounds.width/13.89)
            }
            
            headView.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(viewBounds.height/203)
                make.top.equalTo(headLabel.snp.bottom).offset(viewBounds.height/55.62)
                make.centerX.equalToSuperview()
            }
            
            searchButton.snp.makeConstraints { make in
                make.width.equalTo(viewBounds.width/11.36)
                make.height.equalTo(viewBounds.height/21.71)
                make.centerY.equalTo(headLabel)
                make.left.equalTo(headLabel.snp.right).offset(viewBounds.width/23.44)
            }
            
            myPageButton.snp.makeConstraints { make in
                make.width.equalTo(viewBounds.width/25)
                make.height.equalTo(viewBounds.height/38.67)
                make.centerY.equalTo(searchButton)
                make.left.equalTo(searchButton.snp.right).offset(viewBounds.width/26.79)
            }
            
        }
}
