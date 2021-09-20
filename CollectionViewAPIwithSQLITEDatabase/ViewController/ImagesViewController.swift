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
      //  updatedatabase()
        //viewModel.apiCall()
        updatedatabase()

    }
    
    func  registerCell() {
        collectionView.register(UINib(nibName: Constants.PicturesCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.PicturesCollectionViewCell)
    }
    
    func updatedatabase() {
        SQLiteDatabase.share.createtables()
        SqliteStatments.collectionView = self.collectionView
        SqliteStatments.insertData()
        SqliteStatments.presentRow()
        print(SqliteStatments.presentRow().count)
        
        collectionView.reloadData()
        
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
        return CGSize(width: 200, height: 200)
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let details = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
                viewModel.detailData(indext: indexPath.row, dataOf: details.self)
                self.navigationController?.pushViewController(details, animated: true)
            }

        }
    
    
}
