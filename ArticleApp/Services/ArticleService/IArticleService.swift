//
//  IArticleService.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

protocol  IArticleService {
    
    func appendArticle(_ article: Article)
    func getAll() -> [Article]
    
}
