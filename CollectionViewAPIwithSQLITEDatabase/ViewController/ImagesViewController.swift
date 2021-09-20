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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.collectionView = self.collectionView
        viewModel.apiCall()

    }
    
    func  registerCell() {
        collectionView.register(UINib(nibName: Constants.PicturesCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.PicturesCollectionViewCell)
    }


}

extension ImagesViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PicturesCollectionViewCell, for: indexPath) as? PicturesCollectionViewCell else { fatalError() }
        let theurlStirng = viewModel.collectionArry[indexPath.row]
        print(viewModel.collectionArry.count)
        cell.condfigration(urldata: theurlStirng)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let details = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
                let theElement = viewModel.collectionArry[indexPath.row]
                details.config(elem: theElement)
                self.navigationController?.pushViewController(details, animated: true)
            }
    
        }
    
    
}
