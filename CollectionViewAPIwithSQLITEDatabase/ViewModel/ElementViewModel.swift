//
//  ElementViewModel.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import Foundation

class Elements {
    let date: String
    let explanation: String
    var mediaType: String
    let url: String
    
    init(date: String,
         explanation: String,
         mediaType: String,
         url: String) {
        self.date = date
        self.explanation = explanation
        self.mediaType = mediaType
        self.url = url
    }
    
}

class Elementtt {
    let date: String
    let explanation: String
    var mediaType: String
    let url: String
    
    init(date: String,
         explanation: String,
         mediaType: String,
         url: String) {
        self.date = date
        self.explanation = explanation
        self.mediaType = mediaType
        self.url = url
    }
    
}


