//
//  UserViewController.swift
//  SimpleTableViewAPP
//
//  Created by Navid on 2/19/20.
//  Copyright © 2020 UnitedStar. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = getInitialUsers()
        
        let userApiCallerObj = UserAPICaller()
        userApiCallerObj.delegate = self
        userApiCallerObj.getAllUsersFromURL()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func getInitialUsers() -> [User] {
        //THIS IS FOR TEST PURPOSE
        var usersList:[User] = []
        usersList.append(User(userName: "Navid"))
        usersList.append(User(userName: "Kamal"))
        usersList.append(User(userName: "Jamal"))
        usersList.append(User(userName: "Damal"))
        return usersList
    }
    
}


extension UserViewController: UITableViewDelegate, UITableViewDataSource, DataPass {
    func showResultWith(userList: [User]) -> Void {
        users = userList
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        cell.userLabel.text = user.userName
        return cell
    }
    
    
}
