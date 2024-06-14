//
//  HeaderDetailView.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 14.06.2024.
//

import Foundation
import UIKit

class HeaderDetailView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    
    
    private let imgView : UIImageView = {
        let imgView = UIImageView()
        
        return imgView
        
    }()
    
    
    private let titleLabel : UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    private let sourceLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    private let authorLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    private let openSourceBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.roundedRect)
        
        return btn
    }()
}
