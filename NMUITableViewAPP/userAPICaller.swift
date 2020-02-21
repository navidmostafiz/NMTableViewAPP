//
//  userAPICaller.swift
//  NMUITableViewAPP
//
//  Created by Navid on 2/19/20.
//  Copyright © 2020 UnitedStar. All rights reserved.
//

import Foundation


protocol DataPass {
    func showResultWith(userList: [User]) -> Void
}

//IMPLEMENTING CLASS CAN USE THE BELLOW IMPLEMENTATION
//func showResultWith(userList: [User]) -> Void {
//    users = userList
//    tableView.reloadData()
//}

class UserAPICaller {
    
    var delegate:DataPass!
    
    public func getAllUsersFromURL() -> Void {
        callUserAPI()
    }
    
    private func callUserAPI() {
        let session = URLSession.shared
        let apiURL = URL(string: "https://jsonplaceholder.typicode.com/users")
        let task = session.dataTask(with: apiURL!, completionHandler: callBackKoro)
        task.resume()
    }
    
    private func callTheDelegateNow(userListOnline: [User]) -> Void {
        DispatchQueue.main.async {
             self.delegate.showResultWith(userList: userListOnline)
        }
    }
    
    private func callBackKoro(data:Data?, response:URLResponse?, error:Error?) -> Void {
        if data != nil {
            
            var onlineUser:[User] = []
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            
            if let array = json as? [Any] {
                for object in array {
                    if let dictionary = object as? [String: Any] {
                        if let name = dictionary["name"] as? String {
                            onlineUser.append(User(userName: name))
                        }
                    }
                }
            }
            
            self.callTheDelegateNow(userListOnline: onlineUser)
        } else {
            self.callTheDelegateNow(userListOnline: [User(userName: "NoBody Found online")])
        }
    }
}
