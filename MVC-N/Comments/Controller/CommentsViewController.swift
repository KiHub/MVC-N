//
//  ViewController.swift
//  MVC-N
//
//  Created by  Mr.Ki on 03.04.2022.
//  Copyright © 2022 Mr.Ki
//

import UIKit

class CommentsViewController: UIViewController {
    
    var comments = [Comment]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentNetworkService.getComments { (responce) in
            self.comments = responce.comments
            self.tableView.reloadData()
        }
        
    }
}
extension CommentsViewController: UITableViewDelegate {}

extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
}
