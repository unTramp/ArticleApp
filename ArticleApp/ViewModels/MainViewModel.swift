//
//  MainViewModel.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

protocol IMainViewModelDelegate: class {
    func didUpdate()
    func didStartLoading()
    func didFinishLoading()
}

class MainViewModel {
    
    var articleViewModels: [ArticleViewModel] = []
    var articleService = ServiceLocator.shared.articleService
    weak var delegate: IMainViewModelDelegate?
    
    init(delegate: IMainViewModelDelegate) {
        self.delegate = delegate
    }

    func didAppear() {
        
    }
    
    private func showData() {
        let articles: [Article] = self.articleService.getAll()
        var viewModels: [ArticleViewModel] = []
        for article in articles {
            let viewModel = ArticleViewModel(article: article)
            viewModels.append(viewModel)
        }
        self.articleViewModels = viewModels
        
        DispatchQueue.main.async {
            self.delegate?.didUpdate()
            self.delegate?.didFinishLoading()
        }
    }
    
    private func loadData() {
        self.delegate?.didStartLoading()
        let articleRequest = GoogleArticleRequest()
        articleRequest.getArticle { (result) in
            self.showData()
        }
    }
    
    func didTapAddArticle() {
        self.loadData()
    }
}
