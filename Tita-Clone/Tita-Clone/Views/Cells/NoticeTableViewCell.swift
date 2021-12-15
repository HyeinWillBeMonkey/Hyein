//
//  NoticeTableViewCell.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/15.
//

import UIKit
import Then
import SnapKit


class NoticeTableViewCell: UITableViewCell {
    //MARK: - property
    static let identifier = "\(NoticeTableViewCell.self)"
    private let viewBounds = UIScreen.main.bounds
    
    
    //MARK: - lifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addView
    private func addView() {
        [].forEach { self.addSubview($0) }
    }
        
    // MARK: - location
    private func location() {

    }
    
    // MARK: - dataSetting
    func dataSetting() {
       
    }
}
