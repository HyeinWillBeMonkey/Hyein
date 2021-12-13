//
//  TabBarViewController.swift
//  Tita-Clone
//
//  Created by 혜인 on 2021/12/11.
//

import UIKit

class TabBarViewController: UITabBarController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        }
    
       private func setUpTabBar() {
           self.tabBar.tintColor = .black
        
           let mainViewController = UINavigationController(rootViewController: MainViewController())
           mainViewController.tabBarItem.image = UIImage(named: "Tita-homeBtn")
           mainViewController.tabBarItem.selectedImage = UIImage(named: "Tita-SelectHomeBtn")
           mainViewController.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
           
           let noticeViewController = UINavigationController(rootViewController: NoticeViewController())
           noticeViewController.tabBarItem.image = UIImage(named: "Tita-noticeBtn")
           noticeViewController.tabBarItem.selectedImage = UIImage(named: "Tita-SelectNoticeBtn")
           noticeViewController.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)

           let alarmViewController = UINavigationController(rootViewController: AlarmViewController())
           alarmViewController.tabBarItem.image = UIImage(named: "Tita-alarmBtn")
           alarmViewController.tabBarItem.selectedImage = UIImage(named: "Tita-SelectAlarmBtn")
           alarmViewController.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
           
           let mypageViewController = UINavigationController(rootViewController: MypageViewController())
           mypageViewController.tabBarItem.image = UIImage(named: "Tita-mypageBtn")
           mypageViewController.tabBarItem.selectedImage = UIImage(named: "Tita-SelectMypageBtn")
           mypageViewController.tabBarItem.imageInsets = .init(top: 0, left: 0, bottom: -30, right: 0)
           
           viewControllers = [mainViewController, noticeViewController, alarmViewController, mypageViewController]
           self.tabBar.isTranslucent = false
           self.tabBar.backgroundColor = .white
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
        TabBarViewController()
    }
}
@available(iOS 13.0, *)
struct TabBarViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
