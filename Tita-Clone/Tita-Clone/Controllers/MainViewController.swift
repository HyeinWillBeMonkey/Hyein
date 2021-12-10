//
//  MainViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/10.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    //MARK: - Properties
    private let headLabel = UILabel().then {
        $0.text = "광주소프트웨어마이스터고"
        $0.dynamicFont(fontSize: 22, currentFontName: "NotoSans-Bold")
    }
    
    private let headView = UIView().then {
        $0.backgroundColor = .rgba(red: 167, green: 203, blue: 234, alpha: 1)

    }
    
    private let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-Search"), for: .normal)
    }
    
    private let myPageButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-Mypage"), for: .normal)
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
        [headLabel, headView, searchButton, myPageButton].forEach {view.addSubview($0)}
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        headLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/14.25)
            make.left.equalToSuperview().offset(self.view.frame.width/13.89)
        }
        
        headView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(203)
            make.top.equalTo(headLabel.snp.bottom).offset(self.view.frame.height/55.62)
            make.centerX.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(11.36)
            make.height.equalToSuperview().dividedBy(21.71)
            make.centerY.equalTo(headLabel)
            make.left.equalTo(headLabel.snp.right).offset(self.view.frame.width/37.5)
        }
        
        myPageButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(25)
            make.height.equalToSuperview().dividedBy(38.67)
            make.centerY.equalTo(searchButton)
            make.left.equalTo(searchButton.snp.right).offset(self.view.frame.width/26.79)
        }
        
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
