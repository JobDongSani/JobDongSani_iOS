//
//  CustomLoginBtn.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/24.
//

import UIKit

class CusomLoginBtn : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        backgroundColor = .JobDongSani_7190FF
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
