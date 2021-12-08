//
//  LoginViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/07.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    //MARK: - Properties
    private let backImg = UIImageView().then {
        $0.image = UIImage(named: "Tita-LoginVCBack")
    }
    
    private let logoImg = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
    private let welcomeLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.textAlignment = .left
        $0.text = "어서오세요,\nTimeTable입니다!"
        $0.dynamicFont(fontSize: 27, currentFontName: "NotoSans-Bold")
    }
    
    private let idContainer = TextFieldView()
    
    private let pwContainer = TextFieldView().then {
        $0.textField.placeholder = "비밀번호"
        $0.button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
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
        idContainerSetting()
        pwContainerSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        view.addSubview(backImg)
        view.addSubview(logoImg)
        view.addSubview(welcomeLabel)
        view.addSubview(idContainer)
        view.addSubview(pwContainer)
    }
    
    //MARK: - idContainer Setting
    private func idContainerSetting(){
    idContainer.addSubview(idContainer.textField)
    idContainer.addSubview(idContainer.button)
    idContainer.setting(height: self.view.frame.height, width: self.view.frame.width)
    }
    
    //MARK: - pwContainer Setting
    private func pwContainerSetting(){
        pwContainer.addSubview(pwContainer.textField)
        pwContainer.addSubview(pwContainer.button)
        pwContainer.setting(height: self.view.frame.height, width: self.view.frame.width)
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        backImg.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        
        logoImg.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(4.31)
            make.height.equalToSuperview().dividedBy(10.15)
            make.top.equalToSuperview().offset(self.view.frame.height/6.71)
            make.left.equalToSuperview().offset(self.view.frame.width/5.86)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImg.snp.bottom).offset(self.view.frame.height/32.48)
            make.left.equalTo(logoImg)
        }
        
        idContainer.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(self.view.frame.height/15.92)
            make.width.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        pwContainer.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(self.view.frame.height/5.64)
            make.width.equalToSuperview()
        }
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()
    }
}
@available(iOS 13.0, *)
struct LoginViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
 
