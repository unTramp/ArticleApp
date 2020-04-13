//
//  IArticleRequest.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 04/04/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

protocol IArticleRequest {
    var resourceURL: URL { get }
    var articleService: IArticleService { get }
    
    func getArticle(completion: @escaping(Result<Article, Error>) -> Void)
}
