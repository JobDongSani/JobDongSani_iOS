//
//  TabbarViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit

class TabbarViewController : UITabBarController{
    private let homeVc = MainViewController()
    private let  searchVc = SearchViewController()
    private let profileVC = ProfileViewController()
    private let divider = UIView().then{
        $0.backgroundColor = .JobDongSani_F3F3F3
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        vcSetting()
        addView()
        location()
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.title = ""
    }
    private func vcSetting(){
        tabBar.backgroundColor = .white
        homeVc.tabBarItem.image = UIImage(named: "JobDongSani_Home")?.withRenderingMode(.alwaysTemplate)
        searchVc.tabBarItem.image = UIImage(named: "JobDongSani_SearchIcon")?.withRenderingMode(.alwaysTemplate)
        profileVC.tabBarItem.image = UIImage(named: "JobDongSani_Profile")?.withRenderingMode(.alwaysTemplate)
        viewControllers = [homeVc,searchVc,profileVC]
    }
    private func addView(){
        tabBar.addSubview(divider)
    }
    private func location(){
        divider.snp.makeConstraints{
            $0.top.equalTo(tabBar)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}
