//
//  MainViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/10.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - Properties
    private let collectionViewImgList = ["Tita-breakfast", "Tita-lunch", "Tita-dinner"]
    private let collectionViewTitleList = ["오늘의 아침", "오늘의 점심", "오늘의 저녁"]
    private let collectionViewMenuList = ["백미밥\n시레기된장국\n감자채어묵볶음\n치즈계란말이\n깍두기\n시리얼/우유",
                                          "순두부찌개\n마른새우조림\n느타리버섯호박볶음\n찜닭덮밥\n깍두기\n아이스크림",
                                          "백미밥\n바지락살미역국\n영양갈비찜\n깻잎순나물\n두부쑥갓구이/양념장\n깍두기"]
    

    private let topView = MainTopView().then {
        $0.searchButton.addTarget(self, action: #selector(tapSearchButton(_:)), for: .touchUpInside)
        $0.myPageButton.addTarget(self, action: #selector(tapMypageButton(_:)), for: .touchUpInside)
    }
    
    private let mainNoticeView = MainNoticeView().then {
        $0.dataSetting(Content: "주요 공지글", underscoreColor: .rgba(red: 255, green: 196, blue: 196, alpha: 0.75), Writer: "학생회", Title: "체육대회 공지사항", Text: "체육대회 당일 오후 우천으로 인한 일정 변동이 있습니다. 모든 학생들은 확인해주시기 바랍니다. 또한, 첨부한 사진에 오타가 있습니다. 농구 경기의 경우 60분이니 확인 부탁드립니다.")
        $0.moreBtn.addTarget(self, action: #selector(tapMainMore(_sender:)), for: .touchUpInside)
    }
    
    private let bestNoticeView = MainNoticeView().then {
        $0.dataSetting(Content: "BEST 게시글", underscoreColor: .rgba(red: 255, green: 253, blue: 196, alpha: 0.75), Writer: "학생회", Title: "체육대회 공지사항", Text: "체육대회 당일 오후 우천으로 인한 일정 변동이 있습니다. 모든 학생들은 확인해주시기 바랍니다. 또한, 첨부한 사진에 오타가 있습니다. 농구 경기의 경우 60분이니 확인 부탁드립니다.")
        $0.moreBtn.addTarget(self, action:#selector(tapBestMore(_sender:)), for: .touchUpInside)
    }
    
    private let cafeteriaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = UIScreen.main.bounds.width/23.44
        layout.scrollDirection = .horizontal
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
    }
    
     
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func tapSearchButton(_ sender: UIButton){
        print("검색")
    }
    
    @objc private func tapMypageButton(_ sender: UIButton) {
        print("my page")
    }
    @objc private func tapMainMore(_sender: UIButton) {
        print("공지글 더보기")
    }
    
    @objc private func tapBestMore(_sender: UIButton) {
        print("best 더보기")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
       
        location()
        collectionViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, cafeteriaCollectionView, mainNoticeView, bestNoticeView].forEach {view.addSubview($0)}
    }
    
   
    //MARK: - collectionViewSetting
    private func collectionViewSetting() {
        cafeteriaCollectionView.register(CafeteriaCollectionViewCell.self, forCellWithReuseIdentifier:CafeteriaCollectionViewCell.identifier)
        cafeteriaCollectionView.dataSource = self
        cafeteriaCollectionView.delegate = self
        cafeteriaCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 20)
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cafeteriaCollectionView.dequeueReusableCell(withReuseIdentifier: "CafeteriaCollectionViewCell", for: indexPath) as! CafeteriaCollectionViewCell
        cell.dataSetting(Image: collectionViewImgList[indexPath.row], titleText: collectionViewTitleList[indexPath.row], menuText: collectionViewMenuList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/1.19, height: view.frame.height/4.34)
    }
    

    
    // MARK: - Location
    private func location(){
        
        topView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7.59)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        cafeteriaCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.08)
            make.height.equalToSuperview().dividedBy(4.34)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/5.56)
        }
 
        mainNoticeView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.17)
            make.height.equalToSuperview().dividedBy(4.92)
            make.top.equalToSuperview().offset(self.view.frame.height/2.22)
            make.centerX.equalToSuperview()
        }
        
        bestNoticeView.snp.makeConstraints { make in
            make.width.equalTo(mainNoticeView)
            make.height.equalTo(mainNoticeView)
            make.top.equalTo(mainNoticeView.snp.bottom).offset(self.view.frame.height/24.6)
            make.centerX.equalToSuperview()
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MainViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
