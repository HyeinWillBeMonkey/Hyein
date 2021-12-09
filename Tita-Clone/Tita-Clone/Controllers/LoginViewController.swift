//
//  LoginViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/07.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Properties
    private let backImg = UIImageView().then {
        $0.image = UIImage(named: "Tita-LoginVCBack")
    }
    
    private let logoImg = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
    private let welcomeLabel = UILabel().then {
        $0.numberOfLines = 2
        
        $0.text = "어서오세요,\nTimeTable입니다!"
        $0.dynamicFont(fontSize: 27, currentFontName: "NotoSans-Bold")
    }
    
    private let idContainer = TextFieldView().then {
        $0.button.setTitle("아이디를 잊으셨나요?", for: .normal)
        $0.button.setUnderline()
        $0.button.addTarget(self, action: #selector(tapForgetId), for: .touchUpInside)
    }
    
    private let pwContainer = TextFieldView().then {
        $0.textField.placeholder = "비밀번호"
        $0.textField.isSecureTextEntry = true
        $0.button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.button.setUnderline()
        $0.button.addTarget(self, action: #selector(tapForgetPw), for: .touchUpInside)
    }
    
    private let enterButton = UIButton().then {
        $0.setTitle("입장하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.dynamicFont(fontSize: 18, currentFontName: "NotoSans-Bold")
        $0.backgroundColor = .rgb(red: 255, green: 251, blue: 235)
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
        $0.clipsToBounds = false
        $0.addTarget(self, action: #selector(tapEnter), for: .touchUpInside)
    }
    
    private let signUpButton = UIButton().then {
        $0.setTitle("혹시 아직 회원이 아니신가요?", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
        $0.setUnderline()
        $0.addTarget(self, action: #selector(tapSignUp), for: .touchUpInside)
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        keyboardSetting()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    //MARK: - Keybord Setting
    func keyboardSetting() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Selectors
    @objc
    func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -(self.view.frame.height/5.5)
        }
    
    @objc
    func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    @objc
    func tapForgetId() {
        print("id 찾기")
    }

    @objc
    func tapForgetPw() {
        print("pw 찾기")
    }
    
    @objc
    func tapEnter() {
        print("입장")
    }
    
    @objc
    func tapSignUp() {
        print("회원가입")
    }
    
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
        [backImg, logoImg, welcomeLabel, idContainer, pwContainer, enterButton, signUpButton].forEach { view.addSubview($0) }
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
            make.edges.equalToSuperview()
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
        
        enterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3.18)
            make.height.equalToSuperview().dividedBy(20.3)
            make.top.equalTo(pwContainer).offset(self.view.frame.height/6.2)
            make.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(enterButton.snp.bottom).offset(self.view.frame.height/31.23)
            make.centerX.equalToSuperview()
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
 
