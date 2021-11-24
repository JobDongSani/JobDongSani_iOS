//
//  LoginViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit
import SnapKit
import Then

class LoginViewController : BaseVc{
    //MARK: - Properties
    private let title = UILabel().then{
        $0.
    }

    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
    }
    private func addView(){
        
    }
    private func location(){
        
    }
}
