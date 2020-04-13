//
//  ArticleViewModel.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation
import UIKit

class ArticleViewModel {
    
    var title: String?
    var content: String?
    var imageURL: URL?
    var publishedAt: String?
    
    init(article: Article) {
        self.title = article.title
        self.content = article.content
        self.imageURL = article.imageURL
        self.publishedAt = article.publishedAt
    }
}
