//
//  ValidationService.swift
//  DemoApp
//
//  Created by Ashutosh Srivastava on 02/05/21.
//

import Foundation

struct ValidationService{
    private let dummyDatabase = [User(username: "user123",password: "123456")]

    func validateUser(_ username: String?) throws -> String {
        guard let username = username else {throw ValidationError.invalidValue}
        guard username.count > 3 else {throw ValidationError.usernameTooShort}
        guard username.count < 20 else {throw ValidationError.usernameTooLong}
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String{
        guard let password = password else {throw ValidationError.invalidValue}
        guard password.count > 3 else {throw ValidationError.passwordTooShort}
        guard password.count < 20 else {throw ValidationError.passwordTooLong}
        return password
    }
    
    func authenticateCredentials(_ username: String?, _ password: String?) -> Bool {
        
        if let user = dummyDatabase.first(where:{user in
            user.username == username && user.password == password
        }){
            return true;
        }else{
            return false
        }
    }
}


enum ValidationError: LocalizedError{
    case invalidValue
    case usernameTooShort
    case usernameTooLong
    case passwordTooShort
    case passwordTooLong
    
    var errorDescription: String?{
        switch self{
        case .invalidValue:
            return "You have entered invalid value"
        case .usernameTooShort:
            return "Username Too Short"
        case .usernameTooLong:
            return "Username Too Long"
        case .passwordTooShort:
            return "Password Too Short"
        case .passwordTooLong:
            return "Password Too Long"
        }
    }
}
