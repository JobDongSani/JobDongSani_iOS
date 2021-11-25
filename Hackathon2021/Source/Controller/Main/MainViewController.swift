//
//  MainViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/21.
//

import UIKit

class MainViewController : BaseVc{
    private let dummy = ["패딩 기부","패딩 기부","패딩 기부","패딩 기부"]
    private let barCodePageBtn = UIButton().then{
        $0.setImage(UIImage(named: "JobDongSani_BarCode"), for: .normal)
        $0.addTarget(self, action: #selector(barCodePageMove), for: .touchUpInside)
    }
    private let bulletInBoardTableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.register(MainBulletInBoardTableViewCell.self, forCellReuseIdentifier: MainBulletInBoardTableViewCell.identifier)
        $0.separatorColor = .clear
        $0.allowsSelection = false
        $0.estimatedRowHeight = 300
    }

    @objc
    private func barCodePageMove(){
        print("barCodePage 이동")
    }
    
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
        dataSourceAndDelegate()
    }
    private func addView(){
        [barCodePageBtn,bulletInBoardTableView].forEach{view.addSubview($0)}
    }
    private func location(){
        barCodePageBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/14)
            $0.right.equalToSuperview().inset(bounds.width/17.045)
        }
        bulletInBoardTableView.snp.makeConstraints{
            $0.top.equalTo(barCodePageBtn.snp.bottom).offset(bounds.height/54.1333)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    private func dataSourceAndDelegate(){
        [bulletInBoardTableView].forEach{ $0.delegate = self ; $0.dataSource = self}
    }
}
extension MainViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainBulletInBoardTableViewCell.identifier, for: indexPath) as? MainBulletInBoardTableViewCell else{return UITableViewCell()}
        return cell
        
    }


}
