//
//  GetCommentResponce.swift
//  MVC-N
//
//  Created by  Mr.Ki on 03.04.2022.
//  Copyright © 2022 Mr.Ki
//

import Foundation

struct GetCommentResponce {
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [[String: AnyObject]] else {throw NetworkError.failInternetError}
        
        var comments = [Comment]()
        for dictionary in array {
            guard let comment = Comment(dict: dictionary) else { continue }
            comments.append(comment)
        }
        self.comments = comments
    }
}
