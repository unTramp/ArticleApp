//
//  ViewController.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, IRouter {

    private var dataSource: ArticleDataSource!
    private var viewModel: MainViewModel!
    var addArticleButton: UIBarButtonItem!
    var refreshControl = UIRefreshControl()
    
    var tableView : UITableView! {
        didSet {
            self.tableView.refreshControl = self.refreshControl
            self.refreshControl.addTarget(self, action: #selector(refreshAction),
                                          for: .valueChanged)
        }
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.didAppear()
        self.dataSource.setViewModels(self.viewModel.articleViewModels)
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModel(delegate: self)
        self.setUpViews()
        self.setUpConstraints()
        
    }
    
    @objc private func addArticle() {
        self.viewModel.didTapAddArticle()
    }
    
    @objc private func refreshAction() {
        self.viewModel.didTapAddArticle()
    }
    
    private func reloadTableView() {
        self.dataSource.setViewModels(self.viewModel.articleViewModels)
        self.tableView.reloadData()
    }
    

    private func setUpViews() {
        self.navigationItem.title = "LATEST NEWS"
        self.addArticleButton = UIBarButtonItem(barButtonSystemItem: .add,
                                                target: self, action: #selector(addArticle))
        
        self.navigationItem.rightBarButtonItem = addArticleButton
        
        self.tableView = UITableView()
        self.dataSource = ArticleDataSource(self.tableView)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        self.dataSource.router = self /////// ????
        self.view.addSubview(self.tableView)
        
    }

    private func setUpConstraints() {
        self.tableView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    func showArticle(viewModel: ArticleViewModel) {
        let showVC = ArticleShowViewController()
        showVC.setUpWithViewModel(viewModel: viewModel)
        self.navigationController?.pushViewController(showVC, animated: true)
    }

}



extension MainViewController: IMainViewModelDelegate {
    func didUpdate() {
        self.reloadTableView()
    }
    
    func didStartLoading() {
        print("VC didStartLoading")
    }
    
    func didFinishLoading() {
        self.refreshControl.endRefreshing()
        print("VC didFinishLoading")
    }
}
