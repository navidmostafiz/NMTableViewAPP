//
//  UserViewController.swift
//  NMUITableViewAPP
//
//  Created by Navid on 2/19/20.
//  Copyright © 2020 UnitedStar. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataPass {

    @IBOutlet weak var tableView: UITableView!
    
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LETS CREATE THE LIST OF USERS
        users.append(User(userName: "Navid"))
        users.append(User(userName: "Kamal"))
        users.append(User(userName: "Jamal"))
        users.append(User(userName: "Damal"))
        
        //DELEGATE AND DATASOURCE SET TO SELF, INSTANCE OF THIS CLASS
        tableView.delegate = self
        tableView.dataSource = self
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
    
    func showResultWith(userList: [User]) -> Void {
        users = userList
        tableView.reloadData()
    }
}
