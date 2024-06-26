//
//  NewsCardCollectionViewCell.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import UIKit
import SDWebImage

class NewsCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCardCollectionViewCell"
    private var url : String? = ""
    
    var delegate: Navigatable? = nil
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOn))
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(gesture)
        contentView.addSubview(imgView)
        contentView.addSubview(textContainer)
        textContainer.addSubview(titleLabel)
        textContainer.addSubview(sourceLabel)
        applyConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("NewsCardCollectionViewCell not initialized")
    }
    
    
    private func applyConstraints(){
        imgView.translatesAutoresizingMaskIntoConstraints = false
        textContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // imgView constraints
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.35),
            
            
            // textContainer constraints
            textContainer.topAnchor.constraint(equalTo: imgView.bottomAnchor),
            textContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65),
            
            // title constraints
            titleLabel.topAnchor.constraint(equalTo: textContainer.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: textContainer.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: textContainer.trailingAnchor, constant: -3),
            
            
            // sourceName constraints
            sourceLabel.leadingAnchor.constraint(equalTo: textContainer.leadingAnchor, constant: 5),
            sourceLabel.trailingAnchor.constraint(equalTo: textContainer.trailingAnchor, constant: -5),
            sourceLabel.bottomAnchor.constraint(equalTo: textContainer.bottomAnchor, constant: -10),
            
            
        ])
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
        titleLabel.font = FontK.BebasNeue.bebas22px
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 4
        
        
        return titleLabel
    }()
    
    private let sourceLabel : UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.textColor = ColorK.flashWhite
        sourceLabel.font = FontK.BebasNeue.bebas12px
        sourceLabel.numberOfLines = 1
        return sourceLabel
    }()
    
    @objc private func didTapOn(){
        let article = HomeViewModel.shared.rawCollection.findIndex(title: titleLabel.text!)
        let vc = HeaderDetailView()
        vc.newsDetailVM = HeaderDetailViewModel.fromArticle(article!)
        
        delegate?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    public func configure(vm: NewsCardViewModel){
        self.titleLabel.text = vm.newsTitle
        self.sourceLabel.text = vm.sourceName
        self.url = vm.sourceUrl
        self.imgView.sd_setImage(with: URL(string: vm.imgUrl))
    }
    
    
}
