//
//  NoticeViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/12.
//

import UIKit
import SnapKit
import Then

class NoticeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    //MARK: - Properties
    
    private let topView = NoticeTopView().then {
        $0.prevButton.addTarget(self, action: #selector(tapPrevBtn(_:)), for: .touchUpInside)
    }
    private let noticeTableView = UITableView().then {
        $0.separatorStyle = .singleLine
        $0.separatorInset.left = 0
        $0.separatorInset.right = 0
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func tapPrevBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
        tableViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, noticeTableView].forEach { view.addSubview($0) }
    }
    
    //MARK: - TableViewSetting
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeTableViewCell.identifier) as! NoticeTableViewCell
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/7.09
        

    }
    
    //MARK: - tableView Setting
    private func tableViewSetting(){
        noticeTableView.dataSource = self
        noticeTableView.delegate = self
        
        noticeTableView.register(NoticeTableViewCell.self, forCellReuseIdentifier: NoticeTableViewCell.identifier)
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.59)
        }
        
        noticeTableView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.32)
            make.height.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/38.1)
            make.centerX.equalToSuperview()
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct NoticeViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        NoticeViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            NoticeViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif

