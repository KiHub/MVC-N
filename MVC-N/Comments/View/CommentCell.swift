//
//  CommentCell.swift
//  MVC-N
//
//  Created by  Mr.Ki on 03.04.2022.
//  Copyright © 2022 Mr.Ki
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
