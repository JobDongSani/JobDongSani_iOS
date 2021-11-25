//
//  SearchTableViewCell.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class SearchTableViewCell : UITableViewCell {
    static let identifier = "SearchTableViewCell"
    
    let iv = UIImageView().then{
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
    }
    let title = UILabel().then{
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 13)
        $0.text = "제목"
        $0.textColor = .black
    }
    let writer = UILabel().then{
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
        $0.textColor = .black
        $0.text = "작성자"
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        location()
    }
    private func addView(){
        [iv,title,writer].forEach{ contentView.addSubview($0)}
    }
    private func location(){
        iv.snp.makeConstraints{
            $0.height.width.equalTo(contentView.snp.height).inset(10)
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(12)
        }
        title.snp.makeConstraints{
            $0.left.equalTo(iv.snp.right).offset(14)
            $0.top.equalTo(iv).offset(8)
        }
        writer.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(6)
            $0.left.equalTo(title)
        }
    }
}
