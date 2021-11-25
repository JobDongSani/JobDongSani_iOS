//
//  ListTableViewCell.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit
class ListTableViewCell: UITableViewCell{
    static let identifier = "ListTableViewCell"
    let bgView = UIView().then{
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    let titleLabel = UILabel().then{
        $0.textColor = .black
        $0.dynamicFont(fontSize: 14, fontName: "AppleSDGothicNeo-Light")
    }
    let dateLabel = UILabel().then{
        $0.textColor = .black
        $0.text = "2021-11-24"
        $0.dynamicFont(fontSize: 8, fontName: "AppleSDGothicNeo-Light")
    }
    let kindLabel = UILabel().then{
        $0.textColor = .black
        $0.text = "플라스틱"
        $0.dynamicFont(fontSize: 10, fontName: "AppleSDGothicNeo-Light")
    }
    let recyclingLabel = UILabel().then{
        $0.textColor = .black
        $0.text = "분리수거 방법:"
        $0.dynamicFont(fontSize: 10, fontName: "AppleSDGothicNeo-Light")
    }
    //MARK: - Initalizer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        location()
        contentView.layer.applySketchShadow(color: .black, alpha: 0.1, x: -4, y: 3, blur: 20, spread: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 12, left: 22, bottom: 12, right: 22))
    }
    private func addView(){
        contentView.addSubview(bgView)
        [titleLabel,dateLabel,kindLabel,recyclingLabel].forEach{ bgView.addSubview($0)}
    }
    private func location(){
        bgView.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.left.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(13)
        }
        dateLabel.snp.makeConstraints{
            $0.centerY.equalTo(titleLabel)
            $0.left.equalTo(titleLabel.snp.right).offset(12)
        }
        kindLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.left.equalTo(titleLabel)
        }
        recyclingLabel.snp.makeConstraints{
            $0.top.equalTo(kindLabel.snp.bottom).offset(7)
            $0.left.equalTo(titleLabel)
            $0.right.equalToSuperview().inset(18)
        }
    }
    
}
