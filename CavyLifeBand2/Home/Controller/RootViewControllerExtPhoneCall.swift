//
//  RootViewControllerExtPhoneCall.swift
//  CavyLifeBand2
//
//  Created by xuemincai on 16/6/1.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import CoreTelephony
import RealmSwift

// MARK: - 来电提醒处理
extension RootViewController: SettingRealmListOperateDelegate {
    
    
    
    func phoneCallInit() {
        
        callCenter = CTCallCenter()
        
        notificationSetingList = queryAllSettingList().addNotificationBlock { change in
            
            switch change {
            case .Initial(let value):
                self.vibrateSeconds = value.first?.settingRealmList.first?.settingInfo ?? 0
                self.phoneReminderAble = value.first?.settingRealmList.first?.isOpenSetting ?? false
            case .Update(let value, deletions: _, insertions: _, modifications: _):
                self.vibrateSeconds = value.first?.settingRealmList.first?.settingInfo ?? 0
                self.phoneReminderAble = value.first?.settingRealmList.first?.isOpenSetting ?? false
                break
            default:
                break
                
            }
            
        }
        
        callCenter?.callEventHandler = phoneCall
        
    }
    
    /**
     来电提醒处理
     
     - author: sim cai
     - date: 2016-06-01
     */
    func phoneCall(call: CTCall) {
        
        if call.callState == CTCallStateIncoming && phoneReminderAble == true {
            
            CavyDefine.phoneCallConnectTag = 0
            CavyDefine.bandVibrateTag = 0
            
            NSTimer.runThisAfterDelay(seconds: NSTimeInterval(vibrateSeconds * 5)) {
                
                if CavyDefine.phoneCallConnectTag == 1 {
                    return
                }
                CavyDefine.bandVibrateTag = 1
                LifeBandCtrl.shareInterface.vibrate(10)
            }
            
        } else if call.callState == CTCallStateConnected && phoneReminderAble == true {
            
            CavyDefine.phoneCallConnectTag = 1
            
            if CavyDefine.bandVibrateTag == 1 {
                LifeBandCtrl.shareInterface.stopVibrate()
            }
            
        }
        
    }

    
}
