//
//  HomeViewController.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import UIKit

class HomeViewController: UIViewController{
    
    private var collection = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(filterBtnCollection)
        view.addSubview(newsCardCollection)
        self.newsCardCollection.delegate = self
        self.newsCardCollection.dataSource = self

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newsCardCollection.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NewsAPI.shared.getTopHeaders{
            results in
            
            switch results {
            case .success(let success):
                DispatchQueue.main.async{
                    self.collection = success.articles!
                    
                    self.newsCardCollection.reloadData()
                }
            case .failure(let failure):
                print("failure")
                print(failure)
            }
        }
        
    }
    
    private let filterBtnCollection : UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = ColorK.steelBlack
        return collectionView
            
    }()
    
    private let newsCardCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = ColorK.steelBlack
        collectionView.register(NewsCardCollectionViewCell.self, forCellWithReuseIdentifier: NewsCardCollectionViewCell.identifier)
        return collectionView
    }()
    
        
    
    
}

//MARK: CollectionViewDelegation
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.newsCardCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCardCollectionViewCell.identifier, for: indexPath) as! NewsCardCollectionViewCell
            
            cell.configure(vm: NewsCardViewModel.fromArticle(self.collection[indexPath.row]))
            
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 15, height: view.frame.height/3)
    }
    
    
}