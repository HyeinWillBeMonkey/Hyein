//
//  HeartBoxView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/18.
//

import UIKit

class HeartBoxView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    private let heart = UIButton().then {
        $0.setImage(UIImage(named: "Tita-heart"), for: .normal)
    }
    
    private let setting = UIButton().then {
        $0.setImage(UIImage(named: "Tita-set"), for: .normal)
    }
    
    private let line = UIView().then {
        $0.backgroundColor = .rgb(red: 125, green: 125, blue: 125)
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
        [heart, setting, line].forEach { addSubview($0) }
    }
    
    //MARK: - location
    private func location() {
        self.layer.cornerRadius = viewBounds.width/116.82
        self.layer.borderWidth = viewBounds.width/694.44
        self.layer.borderColor = UIColor.rgb(red: 125, green: 125, blue: 125).cgColor
        
        heart.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(viewBounds.width/50)
            make.width.equalTo(viewBounds.width/37.28)
            make.height.equalTo(viewBounds.height/106.28)
        }
        
        line.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(heart.snp.right).offset(viewBounds.width/52.97)
            make.width.equalTo(viewBounds.width/1388.89)
            make.height.equalTo(viewBounds.height/81.2)
        }
        
        setting.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(line.snp.right).offset(viewBounds.width/43.76)
            make.width.equalTo(viewBounds.width/141.51)
            make.height.equalTo(viewBounds.height/89.43)
        }
    }
}
