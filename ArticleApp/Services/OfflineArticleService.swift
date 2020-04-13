//
//  OfflineArticleService.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 28/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

class OfflineArticleService: IArticleService {
    func appendArticle(_ article: Article) {
        print("append article")
    }
    
    func getAll() -> [Article] {
        return [Article(title: "Заголовок 1", content: "Какой-то текст", imageURL: URL(fileURLWithPath: "https://image.freepik.com/free-vector/404_23-2148090003.jpg"), publishedAt: "00"), Article(title: "Заголовок 2", content: "Другой текст", imageURL: URL(fileURLWithPath: "https://image.freepik.com/free-vector/404_23-2148090003.jpg"), publishedAt: "00"), Article(title: "Заголовок 3", content: "Хороший текст", imageURL: URL(fileURLWithPath: "https://image.freepik.com/free-vector/404_23-2148090003.jpg"), publishedAt: "00")]
    }  
}
