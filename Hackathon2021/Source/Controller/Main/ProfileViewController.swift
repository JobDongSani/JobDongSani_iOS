//
//  ProfileViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit

class ProfileViewController : BaseVc{
    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private let profilebtn = UIButton().then{
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
        $0.addTarget(self, action: #selector(profileEdit), for: .touchUpInside)
    }
    private let titleLabel = UILabel().then{
        $0.text = "이름"
        $0.textColor = .black
    }
    private let userName = UILabel().then{
        $0.text = "username"
        $0.textColor = .JobDongSani_868686
    }
    //MARK: - Selector
    @objc
    private func profileEdit(){
        self.present(self.imagePicker, animated: true)
    }
    
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
        imagePickerSetting()
        profilebtn.layer.cornerRadius = profilebtn.frame.height/2

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profilebtn.layer.cornerRadius = profilebtn.frame.height/2
    }
    
    private func imagePickerSetting(){
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        
    }
    private func addView(){
        [profilebtn,titleLabel,userName].forEach{ view.addSubview($0)}
    }
    private func location(){
        profilebtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/23.4)
            $0.height.width.equalTo(bounds.height/16.5714)
            $0.left.equalToSuperview().offset(bounds.width/17.85)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(profilebtn).offset(5)
            $0.left.equalTo(profilebtn.snp.right).offset(18)
        }
        userName.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalTo(titleLabel)
        }
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            var newImage: UIImage? = nil // update 할 이미지
            if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                newImage = possibleImage
            } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                newImage = possibleImage
            }
            profilebtn.setImage(newImage, for: .normal)
            profilebtn.layer.cornerRadius = profilebtn.frame.height/2
            picker.dismiss(animated: true, completion: nil
            )
        }
    }
