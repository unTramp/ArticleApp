//
//  ArticleTableViewCell.swift
//  SimpleNewsApp
//
//  Created by Andrey Dorofeev on 13/03/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    static var id = "baseID"
    
    var titleLabel: UILabel! {
        didSet {
            self.titleLabel.font = UIFont(name: "Montserrat", size: 16.0)
            self.titleLabel.lineBreakMode = .byWordWrapping
            self.titleLabel.numberOfLines = 3
        }
    }
    
    var articleImageView: UIImageView! {
        didSet {
            self.articleImageView.image = UIImage(named: "articleDefaultImage")
            self.articleImageView.layer.cornerRadius = 8
            self.articleImageView.clipsToBounds = true
        }
    }
    
    var publishedTime: UILabel! {
        didSet {
            self.publishedTime.font = UIFont(name: "Montserrat", size: 12.0)
            self.publishedTime.textColor = .lightGray
        }
    }
    
    var continueButton: UIButton!
    var containerView: UIView!
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViewModel(viewModel: ArticleViewModel) {
        self.titleLabel?.text = viewModel.title
        if let url = viewModel.imageURL {
            self.articleImageView.kf.setImage(with: url,
            placeholder: UIImage.from(color: UIColor(hex: 0xF6F6F9)),
            options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.5)),
            ])
        }
        self.publishedTime.text = Date.getTimeAgo(timeString: viewModel.publishedAt ?? "0")
    }
    
    func setUpViews() {
        self.containerView = UIView()
        self.contentView.addSubview(self.containerView)
        
        self.articleImageView = UIImageView(image: UIImage())
        self.containerView.addSubview(self.articleImageView)
        
        self.titleLabel = UILabel()
        self.containerView.addSubview(self.titleLabel)
        
        self.publishedTime = UILabel()
        self.containerView.addSubview(self.publishedTime)
        
        self.continueButton = UIButton()
        self.continueButton.setImage(UIImage(named: "continue_icon"), for: .normal)
        self.containerView.addSubview(self.continueButton)
        self.continueButton.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.bottom.equalToSuperview().inset(17)
            make.trailing.equalToSuperview().inset(17)
        }
        
        
        let buttomLine = UIColor.black.as1ptImage()
        let buttomLileView = UIImageView(image: buttomLine)
        self.addSubview(buttomLileView)
        buttomLileView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setUpConstraints() {
        self.containerView.snp.makeConstraints { (make) in
             make.top.equalToSuperview()
             make.bottom.equalToSuperview()
             make.leading.equalToSuperview()
             make.trailing.equalToSuperview()
             make.height.equalTo(133).priority(.high)
        }
        
        self.articleImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(93)
            make.width.equalTo(131)
            make.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.articleImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        self.publishedTime.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(self.articleImageView.snp.trailing).offset(20)
            make.width.equalTo(160)
            make.height.equalTo(20)
        }
    }
}
