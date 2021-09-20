//
//  ViewModel.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit

class ViewModel {
    
     var collectionArry = [Elementtt]()
    var collectionView: UICollectionView?
    
    func apiCall() {
        jsonParsing.parsing { [weak self] data in
            switch data {
            case.success(let theData):
                for datas in theData {
                    if datas.mediaType == Constants.image {
                        self?.collectionArry.append(Elementtt(date: datas.date ?? "", explanation: datas.explanation ?? "", mediaType: datas.mediaType ?? "", url: datas.url ?? ""))
                    }
                    DispatchQueue.main.async {
                        self?.collectionView?.reloadData()
                    }
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func dataImage(st: String, images: PicturesCollectionViewCell) {
        DownloadImage.imageDowloag(string: st ) { data in
            guard let imag = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                images.collectionimage.image = imag
            }
            
        }
    }
    
    func detailData(st: String, dataOf: DetailsViewController) {
        
        
    }
    
    
}
