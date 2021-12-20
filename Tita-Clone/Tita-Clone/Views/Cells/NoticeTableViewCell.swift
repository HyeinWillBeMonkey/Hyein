//
//  NoticeTableViewCell.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/15.
//

import UIKit
import Then
import SnapKit
import SwiftUI


class NoticeTableViewCell: UITableViewCell {
    //MARK: - property
    static let identifier = "\(NoticeTableViewCell.self)"
    private let viewBounds = UIScreen.main.bounds
    
    private let writer = UILabel().then {
        $0.text = "익명"
        $0.dynamicFont(fontSize: 17, currentFontName: "NotoSans-Bold")
    }
    
    private let date = UILabel().then {
        $0.text = "05/24 14:20"
        $0.dynamicFont(fontSize: 13, currentFontName: "NotoSans")
        $0.textColor = .rgb(red: 171, green: 171, blue: 171)
    }
    
    private let title = UILabel().then {
        $0.text = "이번 한국사 시험 범위 아는 사람!"
        $0.dynamicFont(fontSize: 16, currentFontName: "NotoSans")
    }
    
    private let text = UILabel().then {
        $0.text = "급하니까 제대로 아는사람 빨리 알려줘ㅜㅜ"
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
    }

    private let heartBox = HeartBoxView()
    
    private let contentCheck = ContentCheckView()
    
    //MARK: - lifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addView()
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: viewBounds.height/81.2, left: viewBounds.width/812, bottom: viewBounds.height/81.2, right: viewBounds.width/28.85))
    }
    
    // MARK: - addView
    private func addView() {
        [writer, date, title, text, heartBox, contentCheck].forEach { contentView.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {
        writer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        date.snp.makeConstraints { make in
            make.bottom.equalTo(writer)
            make.left.equalTo(writer.snp.right).offset(viewBounds.width/96.4)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(viewBounds.height/246.1)
            make.left.equalToSuperview()
        }
        
        text.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(viewBounds.height/116)
            make.left.equalToSuperview()
        }
        
        heartBox.snp.makeConstraints { make in
            make.top.equalTo(writer)
            make.right.equalToSuperview().inset(viewBounds.width/125)
            make.width.equalTo(viewBounds.width/8.33)
            make.height.equalTo(viewBounds.height/50.75)
        }
        
        contentCheck.snp.makeConstraints { make in
            make.top.equalTo(text.snp.bottom).offset(viewBounds.height/203)
            make.left.equalToSuperview()
            make.width.equalTo(viewBounds.width/5.59)
            make.height.equalTo(viewBounds.height/54.13)
        }
        
    }

}
