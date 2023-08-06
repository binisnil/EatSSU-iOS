//
//  NickName.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/08/02.
//

import RealmSwift
import Realm

class NickName: Object {
    @Persisted(primaryKey: true) var token: String = ""
    @Persisted var nicknName: String = ""
    
    convenience init(token: String, nickName: String) {
        self.init()
        
        self.token = token
        self.nicknName = nickName
    }
}
