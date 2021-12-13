//
//  NoticeViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/12.
//

import UIKit
import SnapKit
import Then

class NoticeViewController: UIViewController {
    //MARK: - Properties
    
    let notice = UILabel().then {
        $0.text = "NOTICE"
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        view.addSubview(notice)
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        notice.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}

