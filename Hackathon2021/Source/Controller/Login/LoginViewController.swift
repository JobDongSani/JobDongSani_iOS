//
//  LoginViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit
import SnapKit
import Then
import Alamofire
import KeychainSwift

class LoginViewController : BaseVc{
    //MARK: - Properties
    private let titleLabel = UILabel().then{
        let string : NSMutableAttributedString = NSMutableAttributedString(string: "잡동사니 에  오신\n여러분 환영합니다!")
        $0.dynamicFont(fontSize: 20, fontName: "AppleSDGothicNeo-Regular", textStyle: .body)
        $0.textColor = .black
        $0.numberOfLines = 2
        string.setFontForText(textToFind: "잡동사니", withFont:  UIFont().dynamicFont(fontSize: 30, fontName: "AppleSDGothicNeo-Bold"))
        string.setColorForText(textToFind: "잡동사니", withColor:.JobDongSani_7471E7)
        $0.attributedText = string
    }
    private let idTf = CustomLoginTF(type: "ID")
    private let passwordTf = CustomLoginTF(type: "Password")
    private lazy var idStackView = UIStackView(arrangedSubviews: [idTf,passwordTf]).then{
        $0.spacing = bounds.height/32.48
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }
    
    private let loginBtn = CusomLoginBtn().then{
        $0.setTitle("LOGIN", for: .normal)
        $0.addTarget(self, action: #selector(Login), for: .touchUpInside)
    }
    private let noUSerBtn = UIButton().then{
        $0.setTitle("아직회원이 아니신가요?", for: .normal)
        $0.dynamicFont(fontSize: 10, fontName: "AppleSDGothicNeo-Light")
        $0.setTitleColor(.JobDongSani_868686, for: .normal)
        $0.addTarget(self, action: #selector(noUser), for: .touchUpInside)
    }
    
    @objc
    private func noUser(){
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    @objc
    private func Login(){
        print("Login")
        LoginHttp()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
    }
    private func addView(){
        [titleLabel,idStackView,loginBtn,noUSerBtn].forEach{ view.addSubview($0)}
    }
    private func location(){
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/5.7588)
            $0.left.equalToSuperview().offset(bounds.width/9.375)
        }
        idStackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(bounds.height/7.06)
            $0.right.left.equalToSuperview().inset(bounds.width/9.375)
            $0.height.equalTo(bounds.height/7.58878)
            
        }
        loginBtn.snp.makeConstraints{
            $0.top.equalTo(passwordTf.snp.bottom).offset(bounds.height/11.76811)
            $0.height.equalTo(bounds.height/17.27)
            $0.left.right.equalTo(passwordTf)
        }
        noUSerBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(bounds.height/10.5454 * -1)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(noUSerBtn.titleLabel!)
        }
    }
    private func LoginHttp(){
        let param : Parameters = ["password": passwordTf.tf.text ?? "",
                                  "username":  idTf.tf.text ?? ""]
        SigninRequest.shared.Request(url: "/signin", method: .post, param: param, header: nil,  JSONDecodeUsingStatus: true) { (response) in
            switch response{
            case.success(let value):
                print("\(value)")
                if let data = value as? SigninModel{
                    let keyChain = KeychainSwift()
                    keyChain.set(data.data.accessToken, forKey: "token")
                }
                let controller = TabbarViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            case .requestErr(let err):
                print(err)
            case.pathErr :
                print("PathError")
            case .serverErr:
                print("ServerErr")
            case .networkFail:
                print("Network Fail")
            }
        }
    }
}
