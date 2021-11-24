//
//  DetailViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class DetailViewController : BaseVc {
    private let backBtn = UIButton().then{
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    private let iv = UIImageView().then{
        $0.backgroundColor = .red
    }
    private let titleLabel = UILabel().then{
        $0.text = "제목"
        $0.textColor = .black
    }
    private let writer = UILabel().then{
        $0.text = "작성자"
        $0.textColor = .black
    }
    private let divider = UIView().then{$0.backgroundColor = .JobDongSani_868686}
    private let divider2 = UIView().then{$0.backgroundColor = .JobDongSani_868686}

    private let contentView = UITextView().then{
        $0.textColor = .black
        $0.text = "해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤해커톤"
    }
    
    private let LinkLabel = UILabel().then{
        $0.textColor = .black
        $0.text = "이메일"
    }
    @objc
    private func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
    }
    private func addView(){
        [iv,backBtn,titleLabel,writer,divider,contentView,divider2,LinkLabel].forEach{ view.addSubview($0)}
    }
    private func location(){
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/14)
            $0.left.equalToSuperview().offset(bounds.width/13.9)
            $0.height.width.equalTo(bounds.height/50.75)
        }
        iv.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(bounds.height/1.9)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(iv.snp.bottom).offset(bounds.height/40.6)
            $0.left.equalTo(backBtn.snp.left)
        }
        writer.snp.makeConstraints{
            $0.top.equalTo(iv.snp.bottom).offset(bounds.height/40.6)
            $0.left.equalTo(titleLabel.snp.right).offset(18)
        }
        divider.snp.makeConstraints{
            $0.top.equalTo(writer.snp.bottom).offset(bounds.height/40.6)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        contentView.snp.makeConstraints{
            $0.top.equalTo(divider.snp.bottom)
            $0.height.equalTo(bounds.height/3.18)
            $0.left.right.equalToSuperview()
        }
        divider2.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.bottom)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        LinkLabel.snp.makeConstraints{
            $0.left.equalTo(titleLabel.snp.left)
            $0.top.equalTo(divider2.snp.bottom).offset(bounds.height/40.6)
        }
    }
}
