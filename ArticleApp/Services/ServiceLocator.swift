//
//  ServiceLocator.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 15/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

class ServiceLocator {
    static let shared = ServiceLocator()
    
    let articleService: IArticleService = ArticleService()
}
