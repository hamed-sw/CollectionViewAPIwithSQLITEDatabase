//
//  PicturesCollectionViewCell.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit

class PicturesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionimage: UIImageView!
    var viewModel = ViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
   // func  condfigration(urldata: Elementtt) {
   //     viewModel.dataImage(st: urldata.url, images: self)
//        DownloadImage.imageDowloag(string: urldata.url) {[weak self] data in
//            let img = UIImage(data: data)
//            DispatchQueue.main.async {
//                self?.collectionimage.image = img
//            }
//        }
 //   }

}
