//
//  TextField.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/08.
//

import UIKit
import SnapKit
import Then

class TextFieldView: UIView, UITextFieldDelegate{
    private let viewBounds = UIScreen.main.bounds
    lazy var textField = UITextField().then {
        $0.backgroundColor = UIColor.white
        $0.textColor = .black
        $0.placeholder = "아이디"
        $0.setPlaceholderColor(.rgb(red: 175, green: 175, blue: 175))
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans-Regular")
        $0.delegate = self
        $0.layer.cornerRadius = 10
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
        $0.clipsToBounds = false
        $0.keyboardType = .asciiCapable
    }
    
    lazy var button = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans-Regular")
    }
    
    func setting(height: CGFloat, width: CGFloat) {
        textField.setLeftPaddingPoints(width/18.75)
        
        textField.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(19.33)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(height/73.82)
            make.left.equalTo(textField)
        }
    }

}
