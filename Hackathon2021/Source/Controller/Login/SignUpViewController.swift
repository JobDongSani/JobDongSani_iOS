//
//  SignUpViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit
import Alamofire
class SignUpViewController :BaseVc {
    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private let profile = UIButton().then{
        $0.clipsToBounds = true
        $0.setImage(UIImage(named: "JobDongSani_ProfileBtn"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFill
        $0.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
    }
    private let idTf = CustomLoginTF(type: "ID")
    private let passwordTf = CustomLoginTF(type: "Password")
    private let phoneTf = CustomLoginTF(type: "Phone")
    private let nameTf  = CustomLoginTF(type: "Name")
    
    private lazy var stackView = UIStackView(arrangedSubviews: [idTf,passwordTf,phoneTf,nameTf]).then{
        $0.spacing = bounds.height/32.48
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }
    private let joinBtn = CusomLoginBtn().then{
        $0.setTitle("join", for: .normal)
        $0.addTarget(self, action: #selector(join), for: .touchUpInside)
    }
    private let alreadyAccoutBtn = UIButton().then{
        $0.setTitle("이미 계정이 있으신가요?", for: .normal)
        $0.setTitleColor(.JobDongSani_868686, for: .normal)
        $0.dynamicFont(fontSize: 10, fontName: "AppleSDGothicNeo-Light")
        $0.addTarget(self, action: #selector(alreadyAccount), for: .touchUpInside)
    }
    
    
    //MARK: - Selector
    @objc
    private func pickImage(){
        self.present(self.imagePicker, animated: true)
    }
    @objc
    private func alreadyAccount() {
        navigationController?.popViewController(animated: true)
    }
    @objc
    private func join(){
        httpSignUp()
    }
    
    
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
        imagePickerSetting()
    }
    private func imagePickerSetting(){
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }
    private func addView(){
        [profile,stackView,joinBtn,alreadyAccoutBtn].forEach{ view.addSubview($0)}
    }
    
    private func location(){
        profile.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(bounds.height/8.9)
            $0.width.height.equalTo(bounds.height/6.548)
        }
        stackView.snp.makeConstraints{
            $0.top.equalTo(profile.snp.bottom).offset(bounds.height/12.6875)
            $0.left.right.equalToSuperview().inset(bounds.width/9.375)
            $0.height.equalTo(bounds.height/3.3974)
        }
        joinBtn.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(bounds.height/11.76811)
            $0.height.equalTo(bounds.height/17.27)
            $0.left.right.equalTo(stackView)
        }
        alreadyAccoutBtn.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(bounds.height/10.5454 * -1)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(alreadyAccoutBtn.titleLabel!)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    private func httpSignUp(){
        let param : Parameters = [        "username": idTf.tf.text ?? "",
                                          "password": passwordTf.tf.text ?? "",
                                          "name": nameTf.tf.text ?? "",
                                          "phoneNumber": phoneTf.tf.text ?? "",
                                          "userImage": ""]
        SignUpRequest.shared.Request(url: "/signup", method: .post, param: param, header:  nil, JSONDecodeUsingStatus: false) { (response) in
            switch response{
            case.success(let success):
                print(success)
                let controller =  LoginViewController()
                self.navigationController?.popViewController(animated: true)
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
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil // update 할 이미지
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            newImage = possibleImage
        }
        profile.setImage(newImage, for: .normal)
        profile.layer.cornerRadius = profile.frame.height/2
        picker.dismiss(animated: true, completion: nil
        )
    }
}
