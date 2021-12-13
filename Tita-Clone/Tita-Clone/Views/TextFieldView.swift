//
//  TextField.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/08.
//

import UIKit
import SnapKit
import Then

class TextFieldView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    lazy var textField = UITextField().then {
        $0.backgroundColor = UIColor.white
        $0.textColor = .black
        $0.setPlaceholderColor(.rgb(red: 175, green: 175, blue: 175))
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
        $0.layer.cornerRadius = viewBounds.width/37.5
        $0.layer.applySketchShadow(color: .black, alpha: 0.25, x: 2, y: 2, blur: 10, spread: 0)
        $0.keyboardType = .asciiCapable
        $0.setLeftPaddingPoints(viewBounds.width/18.79)
    }
    
    let button = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.textAlignment = .left
        $0.dynamicFont(fontSize: 12, currentFontName: "NotoSans")
    }
    
// MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
        
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
        
    // MARK: - addView
    private func addView(){
        [textField, button].forEach { addSubview($0) }
    }
        
    // MARK: - location
    private func location(){
        textField.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/1.43)
            make.height.equalTo(viewBounds.height/19.33)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/3.15)
            make.height.equalTo(viewBounds.height/50.75)
            make.top.equalTo(textField.snp.bottom).offset(viewBounds.height/73.82)
            make.left.equalTo(textField)
        }
    }
        
    // MARK: - dataSetting
    func dataSetting(placeholderText : String, buttonTitle : String){
        textField.placeholder = placeholderText
        button.setTitle(buttonTitle, for: .normal)
    }
    

}
