//
//  HomeWebApi.swift
//  CavyLifeBand2
//
//  Created by Jessica on 16/7/4.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import UIKit
import JSONJoy
import Log
import EZSwiftExtensions
import RealmSwift
import Datez

class HomeWebApi: NetRequest, HomeRealmProtocol {
    
    static var shareApi = HomeWebApi()
    
    var realm: Realm = try! Realm()
    
    var userId: String { return CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId }
    
    /**
     某一天的数据
     
     - parameter timeString: yyyy.M.d
     */
    func parserHomeLineData(timeString: String, exist: Bool = false) {
        
        let date = NSDate(fromString: timeString, format: "yyyy.M.d")
    
        let endDate = date!
        
        let parameters: [String: AnyObject] = [NetRequestKey.StartDate.rawValue: endDate.toString(format: "yyyy-MM-dd"), NetRequestKey.EndDate.rawValue: endDate.toString(format: "yyyy-MM-dd")]
   
        netGetRequest(WebApiMethod.Dailies.description, para: parameters, modelObject: HomeLineMsg.self, successHandler: { result in
            
            Log.info(result.data?.dailiesData)
            
            if exist == true {
                
                self.deleteHomeData(timeString)
                
            }
            
            // 保存到本地
            result.data?.dailiesData.forEach {
                
                self.addHomeData(HomeLineRealm(jsonModel: $0))
                
            }
            
            }) { msg in
                
                Log.error(msg)
        }
        
        
    }
    
    
}


