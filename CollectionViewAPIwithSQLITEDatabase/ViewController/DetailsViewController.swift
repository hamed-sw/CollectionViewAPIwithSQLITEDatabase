//
//  DetailsViewController.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailDate: UILabel!
    @IBOutlet weak var detaillable: UILabel!
    
    
    var forDetailDate: String?
    var forDetaillabel: String?
    var forImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailDate.text = forDetailDate
        detaillable.text = forDetaillabel
        detailImage.image = forImage
        

        // Do any additional setup after loading the view.
    }
    
    func config(elem: Elementtt) {
        forDetailDate = elem.date
        forDetaillabel = elem.explanation
        DownloadImage.imageDowloag(string: elem.url) { [weak self] data in
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self?.forImage = image
            }
        }
        
    }
    


}
