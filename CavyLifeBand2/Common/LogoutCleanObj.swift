//
//  LogoutCleanObj.swift
//  CavyLifeBand2
//
//  Created by JL on 16/8/4.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import RealmSwift

struct LogoutCleanObj {
    
    static var shareInstance = LogoutCleanObj()
    
    var realm: Realm = try! Realm()
    
    func deleteUserDBData() {
        self.deleteNSteptDate()
        self.deleteSleepWebRealm()
        self.deleteChartStepDataRealm()
        self.deleteChartSleepDataRealm()
    }
    
}

extension LogoutCleanObj: ChartsRealmProtocol {
    
    var userId: String { return CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId }
    
}
