//
//  JsonParsing.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import Foundation


class jsonParsing {
    
    typealias successfull = (Result<[APINetwork],Error>)->Void
    
    static func parsing(onSucces: @escaping successfull) {
        if let url = URL(string: Constants.theUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if  let error = error {
                    onSucces(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode([APINetwork].self, from: data)
                    onSucces(.success(json))
                }catch {
                    print("there is erro: = \(error)")
                }
            }.resume()
        }
        
    }
}
