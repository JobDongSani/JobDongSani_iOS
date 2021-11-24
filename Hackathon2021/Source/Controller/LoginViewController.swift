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
    private let titleLabel = UILabel().then{
        let string : NSMutableAttributedString = NSMutableAttributedString(string: "잡동사니 에  오신\n여러분 환영합니다!")
        $0.textColor = .black
        $0.numberOfLines = 2
        string.setColor
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
