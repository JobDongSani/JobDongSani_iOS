//
//  SearchViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class SearchViewController : BaseVc{

    private let searchBar = CustomSearchTF()
    private let search_table = UITableView().then{
        $0.backgroundColor = .clear
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.separatorColor = .clear
    }
    override func configure() {
        super.configure()
        searchSetting()
        tableViewSetting()
        addView()
        location()
    }
    private func tableViewSetting(){
        [search_table].forEach{ $0.delegate = self; $0.dataSource = self}

    }
    private func searchSetting(){

    }
    private func addView(){
        [searchBar,search_table].forEach{ view.addSubview($0)}
    }
    private func location(){
        searchBar.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(86)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
        search_table.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else{return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
