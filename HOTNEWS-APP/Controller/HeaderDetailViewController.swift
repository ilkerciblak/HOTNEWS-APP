//
//  HeaderDetailView.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 14.06.2024.
//

import Foundation
import UIKit
import SDWebImage

class HeaderDetailView: UIViewController, WebViewable {
    
    public var newsDetailVM : HeaderDetailViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imgView)
        view.addSubview(contentBox)
        contentBox.addSubview(openSourceBtn)
        contentBox.addSubview(titleLabel)
        contentBox.addSubview(descriptionLabel)
        contentBox.addSubview(authorLabel)
        contentBox.addSubview(sourceLabel)
        self.navigationController?.navigationBar.tintColor = .white
        applyContraints()
        
        openSourceBtn.addTarget(self, action: #selector(didTapOn), for: .touchUpInside)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOn))
//        openSourceBtn.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    
    private func applyContraints(){
        imgView.translatesAutoresizingMaskIntoConstraints = false
        contentBox.translatesAutoresizingMaskIntoConstraints = false
        openSourceBtn.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // IMAGE VIEW CONSTRAINTS
            imgView.topAnchor.constraint(equalTo: view.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imgView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            // ACTION BOX CONSTRAINTS
            contentBox.topAnchor.constraint(equalTo: imgView.bottomAnchor),
            contentBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: contentBox.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -3),
            
            // Header Description Constraints
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -3),
            
            // Source Button Constraints
            openSourceBtn.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            openSourceBtn.heightAnchor.constraint(equalToConstant: 30),
            openSourceBtn.widthAnchor.constraint(equalTo: contentBox.widthAnchor, multiplier: 0.4),
            openSourceBtn.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor),
            
            // Author Label
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 5),
            
            
            // Source Label
            sourceLabel.topAnchor.constraint(equalTo: authorLabel.topAnchor),
            sourceLabel.leadingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 10),
            ])
    }
    
    
    
    
    
    private let imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
        
    }()
    
    private let contentBox: UIView = {
        let box = UIView()
        box.backgroundColor = ColorK.steelBlack
        return box
    }()
    
    
    private let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontK.BebasNeue.bebas22px
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private let sourceLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontK.BebasNeue.bebas22px
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let authorLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontK.BebasNeue.bebas22px
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let openSourceBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.roundedRect)
        btn.setTitle("Read From Source", for: .normal)
        btn.backgroundColor = .orange
        
        return btn
    }()
    
    
    @objc func didTapOn(){
        self.pushWebView(url: self.newsDetailVM?.redirectUrl ?? "")
    }
    
    private func configure()-> Void{
        self.imgView.sd_setImage(with: URL(string: self.newsDetailVM?.imgUrl ?? ""))
        self.titleLabel.text = newsDetailVM?.title
        self.authorLabel.text = newsDetailVM?.author
        self.descriptionLabel.text = newsDetailVM?.description
        self.sourceLabel.text = newsDetailVM?.sourceName
        
    }
    
}
