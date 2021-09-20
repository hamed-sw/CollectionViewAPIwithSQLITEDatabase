//
//  SQiteDatabase.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit
import SQLite

class SqliteStatments {
   static var collectionView: UICollectionView?
    
   static var table = Table("PctureList1")
    static var isEmpty = false
   // var presentDataArray =
    
    static var date = Expression<String>("date")
    static var explanation = Expression<String>("explanation")
    static var mediaType = Expression<String>("media")
    static var url = Expression<String>("url")
    
   static func craeteTable () {
        guard let database = SQLiteDatabase.share.database else {
            print("database connection error")
            return }
    
            do {
                // ifNotExists: true = will not create a table if already exists
                try database.run(table.create(ifNotExists: true) { table in
                    table.column(date)
                    table.column(explanation)
                    table.column(mediaType)
                    table.column(url)
                })
                print("table created successfully")
            }
            catch {
                print("table already exits: \(error)")
            }
        
    }
    
    static func insertData() {
        guard let database = SQLiteDatabase.share.database else {
            print("database connection error")
            return }
        if presentRow().isEmpty {
            isEmpty = true
            
            jsonParsing.parsing {  data in
                switch data {
                case .success(let arrayData):
                    for n in arrayData {
                        if n.mediaType == Constants.image{
                            try! database.run(table.insert( date <- n.date,
                                                            explanation <- n.explanation,
                                                            mediaType <- n.mediaType,
                                                            url <- n.url))
                        }
                    }
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    static func presentRow() -> [Elements] {
        guard let database = SQLiteDatabase.share.database else {
            print("database connection error")
            return [] }
        var maindata = [Elements]()
        do {
            for ourdata in try database.prepare(table) {
                let datavalue = ourdata[date]
                let explanationvalue = ourdata[explanation]
                let mediatypeValue = ourdata[mediaType]
                let urlvalue = ourdata[url]
                // create objeck
                let newObject = Elements(date: datavalue, explanation: explanationvalue, mediaType: mediatypeValue, url: urlvalue)
                //add object into array
                maindata.append(newObject)
            }
            
        }catch {
            print("present row error : \(error)")
        }
        
        return maindata
    }
    
    
}
