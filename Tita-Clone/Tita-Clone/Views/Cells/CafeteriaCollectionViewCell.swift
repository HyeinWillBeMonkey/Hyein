//
//  CafeteriaCollectionViewCell.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/12.
//

import UIKit

class CafeteriaCollectionViewCell: UICollectionViewCell {
    //MARK: - property
    static let identifier = "\(CafeteriaCollectionViewCell.self)"
    lazy var viewBounds = UIScreen.main.bounds
    
    private let backView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.rgb(red: 175, green: 175, blue: 175).cgColor
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 4, y: 4, blur: 4, spread: 0)
    }
    
    lazy var timeImg = UIImageView()
    
    lazy var title = UILabel().then {
        $0.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
    }
    
    lazy var menu = UILabel().then {
        $0.numberOfLines = 0
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans")
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
    private func addView() {
        [backView, timeImg, title, menu].forEach { addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        backView.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/1.19)
            make.height.equalTo(viewBounds.height/4.34)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        timeImg.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/12.1)
            make.height.equalTo(viewBounds.height/49.3)
            make.top.equalTo(backView).offset(viewBounds.height/40.6)
            make.left.equalTo(backView).offset(viewBounds.width/7.21)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(timeImg)
            make.left.equalTo(timeImg.snp.right).offset(viewBounds.width/31.25)
        }
        
        menu.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/58)
            make.centerX.equalTo(backView)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(Image: String, titleText: String, menuText: String) {
        timeImg.image = UIImage(named: Image)
        title.text = titleText
        menu.text = menuText
    }
}
