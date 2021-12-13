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
    private let viewBounds = UIScreen.main.bounds
    
    
    lazy var timeImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
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
        [timeImg, title, menu].forEach { self.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        
        self.backgroundColor = .clear
        self.layer.borderWidth = viewBounds.width/375
        self.layer.borderColor = UIColor.rgb(red: 173, green: 173, blue: 173).cgColor
        self.layer.applySketchShadow(x: 2, y: 2, blur: 4)
        self.layer.cornerRadius = viewBounds.width/18.75
        
        
        timeImg.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/12.5)
            make.height.equalTo(viewBounds.height/21.9)
            make.top.equalToSuperview().offset(viewBounds.height/40.6)
            make.left.equalToSuperview().offset(viewBounds.width/7.21)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(timeImg)
            make.left.equalTo(timeImg.snp.right).offset(viewBounds.width/62.5)
        }
        
        menu.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/58)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(Image: String, titleText: String, menuText: String) {
        timeImg.image = UIImage(named: Image)
        title.text = titleText
        menu.text = menuText
    }
}
