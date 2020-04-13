//
//  ArticleResponse.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 14/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

struct GoogleArticleRequest: IArticleRequest {
    let resourceURL: URL
    let articleService = ServiceLocator.shared.articleService
    
    init() {
        let resouresString = "http://newsapi.org/v2/top-headlines?sources=google-news&apiKey=3ae1dd3ed1ac42a6928c0e3123634974"
        guard let resourceURL = URL(string: resouresString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getArticle(completion: @escaping(Result<Article, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: self.resourceURL) {data, _, _ in
            guard let jsonData = data else { return }
            do {
                let decoder = JSONDecoder()
                let articleData = try decoder.decode(GoogleArticles.self, from: jsonData)
                let articleDetails = articleData.articles
                
                let randomNumber = arc4random_uniform(UInt32(articleDetails.count))
                let randomArticle = articleDetails[Int(randomNumber)]
                let article = Article(title: randomArticle.title, content: randomArticle.content, imageURL: randomArticle.urlToImage, publishedAt: randomArticle.publishedAt)
                self.articleService.appendArticle(article)
                print(article.imageURL.absoluteString) /// test
                completion(.success(article))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
