//
//  ArticleService.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

class ArticleService: IArticleService {
    
    private var articles: [Article] = []
    
    func appendArticle(_ article: Article) {
        self.articles.append(article)
    }
    
    func getAll() -> [Article] {
        return self.articles
    }
}
