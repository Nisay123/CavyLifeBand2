//
//  EventStatisticsProtocol.swift
//  CavyLifeBand2
//
//  Created by JL on 16/7/20.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation

class EventStatisticsApi: NetRequest {
    
    static var shareApi = EventStatisticsApi()
    
    func uploadEventInfo(type: ActivityEventType) {
        
        let macAdd = type == .BandDisconnect ? CavyDefine.bindBandInfos.bindBandInfo.eventBandMacAddressFromUserCache() : CavyDefine.bindBandInfos.bindBandInfo.eventBandMacAddress()
        
        let parameters: [String: AnyObject] = [NetRequestKey.DeviceSerial.rawValue: CavyDefine.bindBandInfos.bindBandInfo.deviceSerial,
                                               NetRequestKey.DeviceModel.rawValue: String.deviceModel(),
                                               NetRequestKey.AuthKey.rawValue: CavyDefine.gameServerAuthKey,
                                               NetRequestKey.BandMac.rawValue: macAdd,
                                               NetRequestKey.Longitude.rawValue: CavyDefine.userCoordinate.longitude,
                                               NetRequestKey.Latitude.rawValue: CavyDefine.userCoordinate.latitude,
                                               NetRequestKey.EventType.rawValue: type.rawValue]
        
        netPostRequest(WebApiMethod.Activities.description, para: parameters, modelObject: CommenMsgResponse.self, successHandler: { (data) in
            Log.info(data.commonMsg.msg)
        }) { (msg) in
            Log.error(msg.msg)
        }
    }
    
    func uploadUMeng(type: ActivityEventType) {
        
        let macAdd = type == .BandDisconnect ? CavyDefine.bindBandInfos.bindBandInfo.eventBandMacAddressFromUserCache() : CavyDefine.bindBandInfos.bindBandInfo.eventBandMacAddress()
        
        let parameters: [String: AnyObject] = [NetRequestKey.DeviceSerial.rawValue: CavyDefine.bindBandInfos.bindBandInfo.deviceSerial,
                                               NetRequestKey.DeviceModel.rawValue: String.deviceModel(),
                                               NetRequestKey.BandMac.rawValue: macAdd,
                                               NetRequestKey.Longitude.rawValue: CavyDefine.userCoordinate.longitude,
                                               NetRequestKey.Latitude.rawValue: CavyDefine.userCoordinate.latitude,
                                               NetRequestKey.UserId.rawValue: CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId]
        
        MobClick.event(type.rawValue, attributes: parameters)
    }
    
}

enum ActivityEventType: String {
    
    case AppOpen        = "APP_OPEN"
    case AppQuit        = "APP_QUIT"
    case UserLogin      = "USER_LOGIN"
    case UserLogout     = "USER_LOGOUT"
    case UserSignup     = "USER_SIGNUP"
    case BandConnect    = "BAND_CONNECT"
    case BandDisconnect = "BAND_DISCONNECT"
    case Unkown         = "Unkown"

}
