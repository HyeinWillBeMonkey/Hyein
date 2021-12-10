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
        [headLabel].forEach {view.addSubview($0)}
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
