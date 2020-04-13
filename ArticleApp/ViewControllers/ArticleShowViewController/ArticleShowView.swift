//
//  ArticleShowView.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 08/04/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation
import UIKit

class ArticleShowView: View {
    
    var articleBigImageView: UIImageView!
    var articleLabel: UILabel!
    var articleDescription: UITextView!
    
    override func setupViews() {
        self.articleBigImageView = UIImageView()
        self.addSubview(self.articleBigImageView)
        
        self.articleLabel = UILabel()
        self.addSubview(self.articleLabel)
        
        self.articleDescription = UITextView()
        self.addSubview(self.articleDescription)
    }
    
    override func setupConstraints() {
    }
}
