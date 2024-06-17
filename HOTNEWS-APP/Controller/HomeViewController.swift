//
//  HomeViewController.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import UIKit

class HomeViewController: UIViewController, Navigatable, Filterable{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(filterBtnCollection)
        view.addSubview(newsCardCollection)
        self.newsCardCollection.delegate = self
        self.newsCardCollection.dataSource = self
        self.filterBtnCollection.delegate = self
        self.filterBtnCollection.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        filterBtnCollection.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.2)
        newsCardCollection.frame = CGRect(x: 0, y: filterBtnCollection.frame.maxY, width: view.frame.width, height: view.frame.height * 0.8)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if HomeViewModel.shared.collection.isEmpty{
            HomeViewModel.shared.getTopHeaders{
                results in
                switch results {
                case .success(_):
                    DispatchQueue.main.async{
                        self.newsCardCollection.reloadData()
                    }
                case .failure(let failure):
                    print("HomeViewController with :\(failure)")
                }
            }
        }
    }
    
    private let filterBtnCollection : UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryFilterBtnView.self, forCellWithReuseIdentifier: CategoryFilterBtnView.identifier)
        collectionView.backgroundColor = ColorK.steelBlack
        return collectionView
            
    }()
    
    private let newsCardCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = ColorK.steelBlack
        collectionView.register(NewsCardCollectionViewCell.self, forCellWithReuseIdentifier: NewsCardCollectionViewCell.identifier)
        
        return collectionView
    }()
    
        
    
    
}

//MARK: CollectionViewDelegation
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.newsCardCollection {
            return HomeViewModel.shared.collection.count
        }else if collectionView == self.filterBtnCollection {
            return NewsApiK.categories.count
        }else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.newsCardCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCardCollectionViewCell.identifier, for: indexPath) as! NewsCardCollectionViewCell
            cell.delegate = self
            cell.configure(vm: HomeViewModel.shared.collection[indexPath.row])
            
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFilterBtnView.identifier, for: indexPath) as! CategoryFilterBtnView
            cell.configure(category: NewsApiK.categories[indexPath.row])
            cell.delegate = self
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.newsCardCollection{
            return CGSize(width: view.frame.width/2 - 15, height: view.frame.height/3)
        }else {
            return CGSize(width: 150, height: 50)
        }
            
        
    }
    
    func reloadTableData(){
        DispatchQueue.main.async{
            self.newsCardCollection.reloadData()
        }
    }
}
