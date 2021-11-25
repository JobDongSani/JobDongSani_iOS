//
//  ProfileViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit

class ProfileViewController : BaseVc{
    //MARK: - Properties
    private let dummy : [String] = ["물품이름","물품이름","물품이름","물품이름","물품이름","물품이름"]
    private let pageTitle = UILabel().then{
        $0.text = "프로필"
        $0.textColor = .black
    }
    private let divider = UIView().then{
        $0.backgroundColor = .JobDongSani_868686
    }
    
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
    private let dividerListView = dividerView(titleString: "List")
    
    private let listTableView = UITableView().then{
        $0.backgroundColor = .clear
        $0.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.separatorColor = .clear
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
        dataSourseAndDelegate()
        profilebtn.layer.cornerRadius = profilebtn.frame.height/2
        listTableView.contentInset = UIEdgeInsets(top: 22, left: 0, bottom: 0, right: 0)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profilebtn.layer.cornerRadius = profilebtn.frame.height/2
    }
    
    private func dataSourseAndDelegate(){
        [listTableView].forEach{ $0.delegate = self; $0.dataSource = self}
    }
    private func imagePickerSetting(){
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }
    private func addView(){
        [pageTitle,profilebtn,divider,titleLabel,userName,dividerListView,listTableView].forEach{ view.addSubview($0)}
    }
    private func location(){
        pageTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/18.45)
            $0.left.equalToSuperview().offset(bounds.width/27.06)
        }
        profilebtn.snp.makeConstraints{
            $0.top.equalTo(divider.snp.bottom).offset(bounds.height/23.4)
            $0.height.width.equalTo(bounds.height/16.5714)
            $0.left.equalToSuperview().offset(bounds.width/17.85)
        }
        divider.snp.makeConstraints{
            $0.top.equalTo(pageTitle.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(profilebtn).offset(5)
            $0.left.equalTo(profilebtn.snp.right).offset(18)
        }
        userName.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalTo(titleLabel)
        }
        dividerListView.snp.makeConstraints{
            $0.top.equalTo(profilebtn.snp.bottom).offset(bounds.height/13)
            $0.left.right.equalToSuperview().inset(bounds.width/17.045)
            $0.height.equalTo(dividerListView.label.frame.height)
        }
        listTableView.snp.makeConstraints{
            $0.top.equalTo(dividerListView.snp.bottom)
            $0.right.left.bottom.equalToSuperview()
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
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        cell.titleLabel.text = dummy[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return bounds.height/6.82
    }
}
