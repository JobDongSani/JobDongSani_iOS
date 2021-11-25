//
//  MainViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/21.
//

import UIKit

class MainViewController : BaseVc{

    var trashdata : [trashShareBoardData?] = []
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
    private let  addBtn = UIButton().then{
        $0.backgroundColor = .systemBlue
        $0.setImage(UIImage(named: "JobDongSani_addBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(addBtnAction), for: .touchUpInside)
        $0.clipsToBounds = true
    }
    @objc
    private func barCodePageMove(){
        print("barCodePage 이동")
        navigationController?.pushViewController(BarcodeViewController(), animated: true)
    }
    @objc
    private func addBtnAction(){ 
        print("추가")
        navigationController?.pushViewController(AddBulletinViewController(), animated: true)
    }
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
        dataSourceAndDelegate()
        searchTrashdata()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addBtn.layer.cornerRadius = addBtn.frame.height/2
        addBtn.layer.applySketchShadow(color: .black, alpha: 0.25, x: 1, y: 1, blur: 4, spread: 0)
    }
    private func searchTrashdata(){
//        trashShareBoardAPI.shared.Request(url: "/trash-share-board", method: .get, param: nil, header: nil, JSONDecodeUsingStatus: true) { (response) in
//            switch response{
//            case.success(let value):
//                print(value)
//                self.trashdata = value as! [trashShareBoardData]
//                self.bulletInBoardTableView.reloadData()
//            case.requestErr(let err):
//                print(err)
//            case.pathErr:
//                print("pathErr")
//            case.networkFail:
//                print("networkFail")
//            case.serverErr:
//                print("serverErr")
//
//            }
//        }
    }
    
    private func addView(){
        [barCodePageBtn,bulletInBoardTableView,addBtn].forEach{view.addSubview($0)}
    }
    private func location(){
        barCodePageBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/14)
            $0.right.equalToSuperview().inset(bounds.width/17.045)
        }
        addBtn.snp.makeConstraints{
            $0.bottom.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.width.equalTo(55)
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
        return trashdata.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainBulletInBoardTableViewCell.identifier, for: indexPath) as? MainBulletInBoardTableViewCell else{return UITableViewCell()}
        cell.title.text = trashdata[indexPath.row]?.title
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: self.trashdata[indexPath.row]!.imagePath)!)
            DispatchQueue.main.async {
                cell.iv.image = UIImage(data: data!)
            }
        }
        cell.writer.text = trashdata[indexPath.row]?.writer
        cell.locationSearch.text = trashdata[indexPath.row]?.location
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
