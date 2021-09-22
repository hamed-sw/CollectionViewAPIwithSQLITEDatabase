//
//  SqilteConnection.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import UIKit
import SQLite

class SQLiteDatabase {
    
    static var share = SQLiteDatabase()
    
    var database: Connection?
    
    private init() {
        // create connection to database
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("apodlist").appendingPathExtension("sqlite3")
            database = try Connection(fileUrl.path)
        }
        catch {
            print("\(error)")
        }
        
    }
    
    func createtables() {
        SqliteStatments.craeteTable()
    }
}
