//
//  ArticleAPI.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 14/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation

struct Articles: Decodable {
    var headlines: [ArticleDetail]
}

struct ArticleDetail: Decodable {
    var info: ArticleInfo
    var title_image: AticleImage
}

struct ArticleInfo: Decodable {
    var title: String
    var rightcol: String
    var publishedAt: String
}

struct AticleImage: Decodable {
    var url: URL
}


