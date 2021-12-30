//
//  ContentCheckView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/18.
//

import UIKit

class ContentCheckView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    private let heart = UIButton().then {
        $0.setImage(UIImage(named: "Tita-CountHeart"), for: .normal)
    }
    
    private let moment = UIButton().then {
        $0.setImage(UIImage(named: "Tita-moment"), for: .normal)
    }
    
    private let heartCount = UILabel().then {
        $0.text = "0"
        $0.dynamicFont(fontSize: 11, currentFontName: "NotoSans")
        $0.textColor = .rgb(red: 255, green: 123, blue: 123)
    }
    
    private let momentCount = UILabel().then {
        $0.text = "0"
        $0.dynamicFont(fontSize: 11, currentFontName: "NotoSans")
        $0.textColor = .rgb(red: 112, green: 135, blue: 255)
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
        [heart, moment, heartCount, momentCount].forEach { addSubview($0) }
    }

    //MARK: - location
    private func location() {
        heart.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(viewBounds.width/28.58)
            make.height.equalTo(viewBounds.height/76.1)
        }
        
        moment.snp.makeConstraints { make in
            make.centerY.equalTo(heart)
            make.left.equalTo(heart.snp.right).offset(viewBounds.width/12.54)
            make.width.equalTo(viewBounds.width/28.87)
            make.height.equalTo(viewBounds.height/67.78)
        }
        
        heartCount.snp.makeConstraints { make in
            make.left.equalTo(heart.snp.right).offset(viewBounds.width/73.24)
            make.bottom.equalTo(heart)
        }
        
        momentCount.snp.makeConstraints { make in
            make.left.equalTo(moment.snp.right).offset(viewBounds.width/91.24)
            make.bottom.equalTo(heartCount)
        }
    }
}
