//
//  AddBulletinViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class AddBulletinViewController : BaseVc{
    private let imagePicker = UIImagePickerController()

    private let backbutton = UIButton().then{
        $0.setImage(UIImage(named: "JobDongSani_BackButton")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        $0.tintColor = .black
    }
    private let imageAddBtn = UIButton().then{
        $0.setImage(UIImage(named: "JobDongSani_Camera")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .lightGray
        $0.addTarget(self, action: #selector(cameraEdit), for: .touchUpInside)
    }
    private let iv = UIImageView().then{
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .gray
    }
    private let divier = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    private let titleLabelTf = CustomLoginTF(type: "제목").then{
        $0.divider.backgroundColor = .lightGray
    }
    private let contentLabelTf = CustomLoginTF(type: "내용").then{
        $0.divider.backgroundColor = .lightGray
    }
    private let phoneLabelTf = CustomLoginTF(type: "전화번호").then{
        $0.divider.backgroundColor = .lightGray
    }
    private let locationLabelTf = CustomLoginTF(type: "지역").then{
        $0.divider.backgroundColor = .lightGray
    }
    private lazy var stackView = UIStackView(arrangedSubviews: [titleLabelTf,contentLabelTf,phoneLabelTf,locationLabelTf]).then{
        $0.spacing = 48
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }
    private let addBulletinBtn = CusomLoginBtn().then{
        $0.setTitle("게시글 작성", for: .normal)
        $0.addTarget(self, action: #selector(addBulletinBtnAction), for: .touchUpInside)
    }
    
    @objc
    private func backBtnAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func cameraEdit(){
        self.present(imagePicker, animated: true, completion: nil)
    }
    @objc
    private func addBulletinBtnAction(){
        navigationController?.popViewController(animated: true)
    }
    override func configure() {
        super.configure()
        addView()
        location()
        imagePickerSetting()
    }
    private func addView(){
        [backbutton,imageAddBtn,iv,divier,stackView,addBulletinBtn].forEach{ view.addSubview($0)}
    }
    private func location(){
        backbutton.snp.makeConstraints{
            $0.top.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.width.equalTo(20)
        }
        imageAddBtn.snp.makeConstraints{
            $0.top.equalTo(backbutton.snp.bottom).offset(33)
            $0.left.equalTo(backbutton)
            $0.height.width.equalTo(bounds.height/16.24)
        }
        iv.snp.makeConstraints{
            $0.top.height.width.equalTo(imageAddBtn)
            $0.left.equalTo(imageAddBtn.snp.right).offset( 15)
        }
        divier.snp.makeConstraints{
            $0.top.equalTo(imageAddBtn.snp.bottom).offset(33)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(0.5)
        }
        stackView.snp.makeConstraints{
            $0.top.equalTo(divier.snp.bottom).offset(bounds.height/16.9)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
        addBulletinBtn.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(bounds.height/8.03)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(bounds.height/17.27)
        }
    }
    private func imagePickerSetting(){
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
extension AddBulletinViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil // update 할 이미지
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            newImage = possibleImage
        }
        iv.image = newImage
        picker.dismiss(animated: true, completion: nil
        )
    }
}
