//
//  GoogleNewsAPI.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 31/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

struct GoogleArticles: Decodable {
    var articles: [GoogleArticle]
}

struct  GoogleArticle: Decodable {
    var title: String
    var content: String
    var urlToImage: URL
    var publishedAt: String
}
