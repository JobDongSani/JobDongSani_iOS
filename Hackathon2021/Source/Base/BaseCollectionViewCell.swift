//
//  BaseCollectionViewCell.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/21.
//

import UIKit

class BaseCollectionViewCell<T>: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(){ }
    var model: T? {
        didSet { if let model = model { bind(model) } }
    }
    func bind(_ model: T){}
}
