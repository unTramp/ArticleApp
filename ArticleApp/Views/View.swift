//
//  View.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 08/04/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import Foundation
import UIKit

class View: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    private func setup() {
        self.setupViews()
        self.setupConstraints()
    }
    
    func setupViews() {
    }
    
    func setupConstraints() {
    }
    
}
