//
//  MainBulletInBoardTableViewCell.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit

class MainBulletInBoardTableViewCell : UITableViewCell{
    static let identifier = "MainBulletInBoardTableViewCell"
    
    let iv = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
    }
    let title = UILabel().then{
        $0.textColor = .black
        $0.text = "패딩 기부합니다"
        $0.dynamicFont(fontSize: 16, fontName: "AppleSDGothicNeo-Regular")
    }
    let writer = UILabel().then{
        $0.textColor = .black
        $0.dynamicFont(fontSize: 12, fontName: "AppleSDGothicNeo-Regular")
    }
    let locationSearch = UILabel().then{
        $0.textColor = .JobDongSani_808080
        $0.dynamicFont(fontSize: 10, fontName: "AppleSDGothicNeo-Light")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        location()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        location()
    }
    private func addView(){
        [iv,writer,locationSearch,title].forEach{ contentView.addSubview($0)}
    }
    private func location(){
        iv.snp.makeConstraints{
            $0.left.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(contentView.snp.height).offset(11)
        }
        title.snp.makeConstraints{
            $0.top.equalTo(iv)
            $0.left.equalTo(iv.snp.right).offset(15)
        }
        writer.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(5)
            $0.left.equalTo(title)
        }
        locationSearch.snp.makeConstraints{
            $0.left.equalTo(title)
            $0.bottom.equalTo(iv)
        }
    }
    
}
