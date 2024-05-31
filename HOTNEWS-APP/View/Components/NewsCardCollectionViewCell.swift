//
//  NewsCardCollectionViewCell.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import UIKit

class NewsCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCardCollectionViewCell"
    private var url : String? = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("NewsCardCollectionViewCell not initialized")
    }
    
    private let imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 10
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let textContainer : UIView = {
        let container = UIView()
        container.backgroundColor = ColorK.balticBlack
        container.layer.cornerRadius = 10
        container.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return container
    }()
    
    private let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = ColorK.flashWhite
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = .zero
        
        return titleLabel
    }()
    
    private let sourceLabel : UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.textColor = ColorK.flashWhite
        sourceLabel.numberOfLines = 1
        return sourceLabel
    }()
    
    
    public func configure(vm: NewsCardViewModel){
        self.titleLabel.text = vm.newsTitle
        self.sourceLabel.text = vm.sourceName
        self.url = vm.sourceUrl
        
        // webView
        // Image
    }
    
    
}
