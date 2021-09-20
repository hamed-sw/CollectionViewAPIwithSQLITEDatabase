//
//  ViewModel.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit

class ViewModel {
    
    var collectionView: UICollectionView?
    
    
    func dataImage(indext: Int, images: PicturesCollectionViewCell) {
        let urldata = SqliteStatments.presentRow().object(at: indext)?.url ?? ""
        DownloadImage.imageDowloag(string: urldata ) { data in
            guard let imag = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                images.collectionimage.image = imag
            }
            
        }
    }
    
    func detailData(st: String, dataOf: DetailsViewController) {
        
        
    }
    
    func totaldataOFDatabase() -> Int? {
        let total = SqliteStatments.presentRow().count
        return total 
    }
    
    
}
