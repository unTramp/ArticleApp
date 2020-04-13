//
//  ArticleDataSource.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation
import UIKit

class ArticleDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModels = [ArticleViewModel]()
    private var tableView: UITableView
    var router: IRouter!
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        self.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.id)
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.allowsSelectionDuringEditing = true
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.id,
                                                      for: indexPath) as! ArticleTableViewCell
        let viewModel = self.viewModels[self.viewModels.count-1 - indexPath.row]
        cell.setUpViewModel(viewModel: viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = viewModels[self.viewModels.count-1 - indexPath.row]
        self.router.showArticle(viewModel: vm)
    }
    
    func setViewModels(_ viewModels: [ArticleViewModel]) {
        self.viewModels = viewModels
    }
    
    func appendViewModel(_ viewModel: ArticleViewModel) {
        self.viewModels.append(viewModel)
    }
    
}
