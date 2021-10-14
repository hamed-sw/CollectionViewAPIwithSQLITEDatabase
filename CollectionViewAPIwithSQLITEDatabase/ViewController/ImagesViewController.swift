//
//  ImagesViewController.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit

class ImagesViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    lazy var viewModel = ViewModel()
    var favorites = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        updatedatabase()
    }
    
    func  registerCell() {
        collectionView.register(UINib(nibName: Constants.PicturesCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.PicturesCollectionViewCell)
    }
    
    func updatedatabase() {
        viewModel.collectionView = self.collectionView
        viewModel.updatedatabase()
    }
}

extension ImagesViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.totaldataOFDatabase() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PicturesCollectionViewCell, for: indexPath) as? PicturesCollectionViewCell else { fatalError() }

        viewModel.dataImage(indext: indexPath.row, images: cell.self)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/2)-4, height: (view.frame.size.width/2)-4)
            //CGSize(width: 200, height: 200)
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let details = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
                viewModel.detailData(indext: indexPath.row, dataOf: details.self)
                self.navigationController?.pushViewController(details, animated: true)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration (identifier: nil,
                                                 previewProvider: nil
        ) { [weak self] _ in
            
            let open = UIAction(title: "Open",
                                image: UIImage(systemName: "link"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off
            ) { [weak self] _ in
                print("open tapped")
            }
            let favorite = UIAction(title: self?.favorites.contains(indexPath.row) == true ? "Remove Favorite" :"favorite",
                                image: UIImage(systemName: "star"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off
            ) { [weak self] _ in
                if self?.favorites.contains(indexPath.row) == true {
                    self?.favorites.removeAll(where: { $0 == indexPath.row })
                } else {
                    self?.favorites.append(indexPath.row)
                }
                print("favorite tapped")
            }
            let search = UIAction(title: "Search",
                                image: UIImage(systemName: "mangifyingglass"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off
            ) { [weak self] _ in
                print("search tapped")
            }
            return UIMenu(title: "Action",
                          image: nil,
                          identifier: nil,
                          options: UIMenu.Options.displayInline,
                          children: [open, favorite, search])
        }
        
        return config
    }
}
