//
//  TabbarViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit

class TabbarViewController : UITabBarController{
    private let homeVc = MainViewController()
    private let  searchVc = MainViewController()
    private let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        vcSetting()
    }
    private func vcSetting(){
        homeVc.tabBarItem.image = UIImage(named: "JobDongSani_Home")?.withRenderingMode(.alwaysTemplate)
        searchVc.tabBarItem.image = UIImage(named: "JobDongSani_SearchIcon")?.withRenderingMode(.alwaysTemplate)
        profileVC.tabBarItem.image = UIImage(named: "JobDongSani_Profile")?.withRenderingMode(.alwaysTemplate)
        viewControllers = [homeVc,searchVc,profileVC]
    }
}
