//
//  NoticeView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/11.
//

import UIKit
import SnapKit
import Then

class NoticeView: UIView {
    //MARK: - property
    lazy var viewBounds = UIScreen.main.bounds
    
    private let backView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.rgb(red: 175, green: 175, blue: 175).cgColor
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 4, y: 4, blur: 4, spread: 0)
    }
    
    lazy var noticeContent = UILabel().then {
        $0.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
    }
    
    lazy var underscore = UIView()
    
    lazy var writer = UILabel().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans-Bold")
    }
    
    lazy var title = UILabel().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans")
    }
    
    lazy var text = UILabel().then {
        $0.dynamicFont(fontSize: 10, currentFontName: "NotoSans")
        $0.numberOfLines = 0
    }
    
    let moreBtn = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.dynamicFont(fontSize: 8, currentFontName: "NotoSans")
        $0.setTitleColor(.rgb(red: 152, green: 152, blue: 152), for: .normal)
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
        [backView, underscore, noticeContent, writer, title, text, moreBtn].forEach { addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        backView.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/1.17)
            make.height.equalTo(viewBounds.height/4.92)
            make.centerX.equalToSuperview()
        }
        
        noticeContent.snp.makeConstraints { make in
            make.top.equalTo(backView).offset(viewBounds.height/54.13)
            make.left.equalTo(backView).offset(viewBounds.width/20.83)
        }
        
        underscore.snp.makeConstraints { make in
            make.width.equalTo(noticeContent.snp.width)
            make.height.equalTo(viewBounds.height/86.11)
            make.top.equalTo(noticeContent).offset(viewBounds.height/45.11)
            make.left.equalTo(noticeContent)
        }
        
        writer.snp.makeConstraints { make in
            make.top.equalTo(underscore.snp.bottom).offset(viewBounds.height/517.2)
            make.left.equalTo(underscore)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(backView)
            make.left.equalTo(writer)
        }
        
        text.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/1.3)
            make.bottom.equalTo(backView).inset(viewBounds.height/49.21)
            make.left.equalTo(title)
        }
        
        moreBtn.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/16.3)
            make.height.equalTo(viewBounds.height/86.11)
            make.bottom.equalTo(text)
            make.left.equalTo(backView).offset(viewBounds.width/1.95)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(Content: String, underscoreColor: UIColor, Writer: String, Title: String, Text: String) {
        noticeContent.text = Content
        underscore.backgroundColor = underscoreColor
        writer.text = Writer
        title.text = Title
        text.text = Text
    }
}
