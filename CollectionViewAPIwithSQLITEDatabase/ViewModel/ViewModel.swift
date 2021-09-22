//
//  ViewModel.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit

class ViewModel {
    
    
    var collectionView: UICollectionView?
    
    func updatedatabase() {
        SQLiteDatabase.share.createtables()
        SqliteStatments.collectionView = self.collectionView
        SqliteStatments.insertData()
        print(SqliteStatments.presentRow().count)
        collectionView?.reloadData()
    }
    
    func dataImage(indext: Int, images: PicturesCollectionViewCell) {
        let urldata = SqliteStatments.presentRow().object(at: indext)?.url ?? ""
        DownloadImage.imageDowloag(string: urldata ) { data in
            guard let imag = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                images.collectionimage.image = imag
            }
        }
    }
    
    func detailData(indext: Int, dataOf: DetailsViewController) {
        dataOf.forDetailDate = SqliteStatments.presentRow().object(at: indext)?.date
        dataOf.forDetaillabel = SqliteStatments.presentRow().object(at: indext)?.explanation
        let  urlData = SqliteStatments.presentRow().object(at: indext)?.url ?? ""
        DownloadImage.imageDowloag(string: urlData) { data in
            guard let imag = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                dataOf.forImage = imag
            }
        }
    }
    
    func totaldataOFDatabase() -> Int? {
        let total = SqliteStatments.presentRow().count
        return total 
    }
}
