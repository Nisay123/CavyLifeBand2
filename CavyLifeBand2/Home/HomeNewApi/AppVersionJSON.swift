//
//  AppVersionJSON.swift
//  CavyLifeBand2
//
//  Created by JL on 16/8/12.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import JSONJoy

struct AppVersionResponse: JSONJoy, CommenResponseProtocol {
    
    // 通用消息
    var commonMsg: CommenResponse
    
    // 版本信息
    var version: String
    
    // 版本描述
    var description: String
    
    init(_ decoder: JSONDecoder) throws {
        
        commonMsg = try CommenResponse(decoder)
        
        do { version = try decoder["data"]["version"].getString() } catch { version = "" }
        do { description = try decoder["data"]["description"].getString() } catch { description = "" }
    }
    
}
