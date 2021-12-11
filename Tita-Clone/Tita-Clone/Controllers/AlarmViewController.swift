//
//  AlarmViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/12.
//

import UIKit
import SnapKit
import Then

class AlarmViewController: UIViewController {
    let alarm = UILabel().then {
        $0.text = "ALARM"
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
        view.addSubview(alarm)
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        alarm.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
