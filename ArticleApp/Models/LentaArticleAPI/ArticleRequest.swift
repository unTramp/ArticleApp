//
//  ArticleResponse.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 14/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

struct ArticleRequest: IArticleRequest {
    let resourceURL: URL
    let articleService = ServiceLocator.shared.articleService
    
    init() {
        let resouresString = "http://api.lenta.ru/lists/latest"
        guard let resourceURL = URL(string: resouresString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    
    func getArticle(completion: @escaping(Result<Article, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: self.resourceURL) {data, _, _ in
            guard let jsonData = data else { return }
            do {
                let decoder = JSONDecoder()
                let articles = try decoder.decode(Articles.self, from: jsonData)
                let articleDetails = articles.headlines
                
                let randomNumber = arc4random_uniform(UInt32(articleDetails.count))
                let randomArticle = articleDetails[Int(randomNumber)]
                let article = Article(title: randomArticle.info.title, content: randomArticle.info.rightcol, imageURL: randomArticle.title_image.url, publishedAt: randomArticle.info.publishedAt)
                self.articleService.appendArticle(article)
                print( self.articleService.getAll())
                completion(.success(article))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
