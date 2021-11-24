//
//  dividerView.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class dividerView : UIView{
    let view = UIView().then{
        $0.backgroundColor = .JobDongSani_808080
    }
    let view2 = UIView().then{
        $0.backgroundColor  = .JobDongSani_808080
    }
    let label = UILabel().then{
        $0.textColor = .JobDongSani_808080
    }
    init(titleString : String){
        super.init(frame: .zero)
        label.text = titleString
        addView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addView(){
        [view,label,view2].forEach{ addSubview($0)}
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        view.snp.makeConstraints{
            $0.left.equalToSuperview()
            $0.right.equalTo(label.snp.left).inset(-11)
            $0.height.equalTo(1)
        }
        view2.snp.makeConstraints{
            $0.right.equalToSuperview()
            $0.left.equalTo(label.snp.right).offset(11)
            $0.height.equalTo(1)
        }
    }
}
