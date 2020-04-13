//
//  ArticleShowViewController.swift
//  ArticleApp
//
//  Created by Andrey Dorofeev on 08/04/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import UIKit

class ArticleShowViewController: UIViewController {
    
    let scrollView = DScrollView()
    let scrollViewContainer = DScrollViewContainer(axis: .vertical, spacing: 10)
    let scrollViewMainImage = DScrollViewElement().withHeight(240)
    let scrollViewContentText = DScrollViewElement()
    
    let textView = UITextView()
    var articleImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.scrollViewContentText.addSubview(self.textView)
        self.scrollViewMainImage.addSubview(self.articleImageView)
        
        self.textView.font = UIFont(name: "Montserrat", size: 16.0)
        self.textView.translatesAutoresizingMaskIntoConstraints = true
        self.textView.sizeToFit()
        self.textView.isScrollEnabled = false
        
        
        self.textView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.articleImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.view.addScrollView(self.scrollView,
                                withSafeArea: .vertical,
                                hasStatusBarCover: true,
                                statusBarBackgroundColor: .clear,
                                container: self.scrollViewContainer,
                                elements: [scrollViewMainImage, scrollViewContentText])
    }
    
    func setUpWithViewModel(viewModel: ArticleViewModel) {

        self.textView.text = viewModel.content

        if let url = viewModel.imageURL {
            self.articleImageView.kf.setImage(with: url,
            placeholder: UIImage.from(color: UIColor(hex: 0xF6F6F9)),
            options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.5)),
            ])
        }
    }
}
