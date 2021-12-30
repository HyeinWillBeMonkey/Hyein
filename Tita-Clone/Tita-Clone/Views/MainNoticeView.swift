//
//  NoticeView.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/11.
//

import UIKit
import SnapKit
import Then

class MainNoticeView: UIView {
    //MARK: - property
    private let viewBounds = UIScreen.main.bounds

    
    let noticeContent = UILabel().then {
        $0.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
    }
    
    let underscore = UIView()
    
    let writer = UILabel().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans-Bold")
    }
    
    let title = UILabel().then {
        $0.dynamicFont(fontSize: 14, currentFontName: "NotoSans")
    }
    
    let text = UILabel().then {
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
        [underscore, noticeContent, writer, title, text, moreBtn].forEach { addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.rgb(red: 175, green: 175, blue: 175).cgColor
        self.layer.cornerRadius = viewBounds.width/18.75
        self.layer.borderWidth = viewBounds.width/375
        self.layer.applySketchShadow(color: .black, alpha: 0.25, x: 4, y: 4, blur: 4, spread: 0)
        

        noticeContent.snp.makeConstraints { make in
            make.top.equalTo(viewBounds.height/54.13)
            make.left.equalTo(viewBounds.width/20.83)
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
            make.centerY.equalToSuperview()
            make.left.equalTo(writer)
        }
        
        text.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/1.3)
            make.bottom.equalToSuperview().inset(viewBounds.height/49.21)
            make.left.equalTo(title)
        }
        
        moreBtn.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/16.3)
            make.height.equalTo(viewBounds.height/86.11)
            make.bottom.equalTo(text)
            make.left.equalTo(viewBounds.width/1.95)
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
