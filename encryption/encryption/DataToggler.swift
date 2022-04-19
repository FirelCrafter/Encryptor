//
//  DataToggler.swift
//  encryption
//
//  Created by Михаил Щербаков on 19.04.2022.
//

import Foundation

class DataToggler {
    
    static let shared = DataToggler()
    
    private init() { }
    
    func turnToData<T>(object: T) -> Data? where T : Decodable, T : Encodable {
        do {
            let data = try PropertyListEncoder.init().encode(object)
            return data
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func turnToObject<T>(data: Data, type: T.Type) -> T? where T : Decodable, T : Encodable {
        do {
            let object = try PropertyListDecoder.init().decode(T.self, from: data)
            return object
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
