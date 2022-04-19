//
//  DataEncryptor.swift
//  encryption
//
//  Created by Михаил Щербаков on 19.04.2022.
//

import Foundation
import RNCryptor

class DataEncryptor {
    
    let data: Data
    let password: String
    let storeKey: String
    let defaults = UserDefaults.standard
    
    
    init(data: Data, password: String, storeKey: String) {
        self.data = data
        self.password = password
        self.storeKey = storeKey
    }
    
    func encrypt() {
        let encryptedData = RNCryptor.encrypt(data: self.data, withPassword: self.password)
        defaults.set(encryptedData, forKey: storeKey)
    }
    
    func decrypt() -> Data? {
        if let savedData = defaults.data(forKey: storeKey) {
            do {
                let originalData = try RNCryptor.decrypt(data: savedData, withPassword: password)
                return originalData
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
}
