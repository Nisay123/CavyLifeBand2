//
//  PKRecordsViewModel.swift
//  CavyLifeBand2
//
//  Created by JL on 16/4/25.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RealmSwift

struct PKRecordsViewModel: PKRecordsRealmModelOperateDelegate {
    
    var loginUserId: String {
        Log.warning("用户ID写死")
        return "12"
    }
    
    var realm: Realm
    
    var pkListModel: PKRecordsRealmModel {
        
        return queryPKRecordsRealm()
        
    }
    
    init(realm: Realm) {
        self.realm = realm
    }

}
