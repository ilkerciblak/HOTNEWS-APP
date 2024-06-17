//
//  CategoryFilterBtnView.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 17.06.2024.
//

import Foundation
import UIKit

class CategoryFilterBtnView: UICollectionViewCell{
    
    static let identifier: String = "CategoryFilterBtnViewCell"
    private var category: String?
    var delegate: Filterable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(btnView)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOn))
//        btnView.addGestureRecognizer(tap)
        btnView.addTarget(self, action: #selector(didTapOn), for: .touchUpInside)
        applyConstraints()
    }
    
    private func applyConstraints(){
        btnView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            
            btnView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            btnView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            btnView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("CategoryFilterBtnView not initialized")
    }
    
    private let btnView: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.roundedRect)
        btn.backgroundColor = .systemPurple
        btn.tintColor = ColorK.flashWhite
        btn.layer.cornerRadius = 15
        btn.titleLabel?.font = FontK.BebasNeue.bebas18px
        return btn
    }()
    
    
    public func configure(category: String){
        self.category = category
        self.btnView.setTitle(category, for: .normal)
        
    }
    
    @objc private func didTapOn(){
        HomeViewModel.shared.getCategoryTopHeaders(category: self.category!){
            result in
            self.delegate?.reloadTableData()
        }
    }
    
    
    
}
