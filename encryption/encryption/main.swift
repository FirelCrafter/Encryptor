//
//  main.swift
//  encryption
//
//  Created by Михаил Щербаков on 19.04.2022.
//

import Foundation


func main() {
    let user = User(firstname: "John", lastname: "Wick", phone: "+924564356")
    print(user)
    
    guard let data = DataToggler.shared.turnToData(object: user) else {
        print("Failed to turn")
        return
    }
    
    let encryptor = DataEncryptor(data: data, password: "1234", storeKey: "UserData")
    encryptor.encrypt()
    
    guard let decryptedUserData = encryptor.decrypt() else {
        print("Error decryption user data")
        return
    }
    
    guard let decryptedUser = DataToggler.shared.turnToObject(data: decryptedUserData, type: User.self) else {
        print("Error turning data to User")
        return
    }
    
    print(decryptedUser)
}

main()

