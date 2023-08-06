//
//  Token.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/27.
//

import RealmSwift
import Realm

/// 나중에
class Token:Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var token = String()
    @Persisted var refreshToken = String()
    
    override static func primaryKey() -> String? {
      return "token"
    }
    
    convenience init(token:String,refreshToken:String){
        self.init()
        self.token = token
        self.refreshToken = refreshToken
    }
}

