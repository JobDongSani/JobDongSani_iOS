//
//  BaseTableViewCell.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/21.
//

import UIKit

class BaseTableViewCell<T> : UITableViewCell{

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        reuse()
    }
    func reuse(){ }
    
    func configure() {
        selectionStyle = .none
    }
    var model: T? {
        didSet { if let model = model { bind(model) } }
    }
    func bind(_ model: T){}
}


