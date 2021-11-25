//
//  CustomSearchTF.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class CustomSearchTF: UIView{
    let bgview = UIView().then{
        $0.backgroundColor = .clear
    }
    let searchBar = UISearchBar().then{
        $0.searchBarStyle = .minimal
    }
    let searchBtn = UIButton().then{
        $0.setTitle("검색", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        [bgview,searchBtn].forEach{addSubview($0)}
        [searchBar].forEach{ bgview.addSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        bgview.snp.makeConstraints{
            $0.top.left.bottom.equalToSuperview()
            $0.right.equalTo(searchBtn.snp.left)
        }
        searchBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(18)
            $0.width.height.equalTo(snp.height)
        }
        searchBar.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
            $0.height.equalToSuperview()
        }
        
    }
}
