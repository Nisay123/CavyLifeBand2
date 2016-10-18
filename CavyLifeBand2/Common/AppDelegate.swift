//
//  AppDelegate.swift
//  CavyLifeBand2
//
//  Created by xuemincai on 16/1/5.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import Log
import EZSwiftExtensions
import RealmSwift

#if UITEST
import OHHTTPStubs
#endif

var realm: Realm = try! Realm()

let UMAPPKey = "579abf0be0f55a8e1e00131a"
let kGtAppId:String = "iQGy0CNwwA8AnZcCXTQ8S6"
let kGtAppKey:String = "lf6MDVzUAi9DEjbLlGVGh3"
let kGtAppSecret:String = "ABWaKOPNAl5TgqpGxmyVgA"
var keepAlive:NSTimer!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LifeBandBleDelegate,GeTuiSdkDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
     
        /**
         5适配
         */
        appFitWithDevice()
        
        realmConfig()
        
        registerShareSdk()
        
        appConfigUMobClickSDK()
        
        setRootViewController()
        
        setUserDefaultCoordinate()
        
        compareIsNewVersionApp()
        
        EventStatisticsApi.shareApi.uploadEventInfo(ActivityEventType.AppOpen)
        
        #if UITEST
            
            uiTestStub()
            
        #endif
        
        
        #if RELEASE

            Log.enabled = false
            
        #endif
        
        
        
        #if DEBUG
            
            //打开友盟测试数据模式
            
            MobClick.setLogEnabled(true)
           
            Log.theme = Theme(
                trace: "#C5C8C6",
                debug: "#81A2BE",
                info: "#B5BD68",
                warning: "#F0C674",
                error: "#CC6666"
            )
            
        #endif
        
        //初始化Bugly
        
        Bugly.startWithAppId("68bfe3e16c")
        
        
        
        //推送设置
        // [ GTSdk ]：使用APPID/APPKEY/APPSECRENT启动个推
        GeTuiSdk.startSdkWithAppId(kGtAppId, appKey: kGtAppKey, appSecret: kGtAppSecret, delegate: self);
        
        // 注册APNs - custom method - 开发者自定义的方法
        self.registerUserNotification(application);
        

        
        return true

    }
    
    //用户通知（推送） 自定义方法
    
    /*
       注册用户通知(推送)
     */
    
    func registerUserNotification(application: UIApplication) {
        let result = UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch)
        if (result != NSComparisonResult.OrderedAscending) {
            UIApplication.sharedApplication().registerForRemoteNotifications()
            
            let userSettings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(userSettings)
        } else {
            UIApplication.sharedApplication().registerForRemoteNotificationTypes([.Alert, .Sound, .Badge])
        }
    }

     // MARK: - 远程通知(推送)回调
    /*
      远程通知注册成功委托
     */
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        var token = deviceToken.description.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<>"));
        token = token.stringByReplacingOccurrencesOfString(" ", withString: "")
        
        // [ GTSdk ]：向个推服务器注册deviceToken
        GeTuiSdk.registerDeviceToken(token);
        
        NSLog("\n>>>[DeviceToken Success]:%@\n\n",token);

    }
    
    /** 远程通知注册失败委托 */
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        NSLog("\n>>>[DeviceToken Error]:%@\n\n",error.description);
    }

    // MARK: - APP运行中接收到通知(推送)处理
    
    /** APP已经接收到“远程”通知(推送) - (App运行在后台/App运行在前台) */
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        application.applicationIconBadgeNumber = 0;        // 标签
        
        NSLog("\n>>>[Receive RemoteNotification]:%@\n\n",userInfo);
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        // [ GTSdk ]：将收到的APNs信息传给个推统计
        GeTuiSdk.handleRemoteNotification(userInfo);
        
        NSLog("\n>>>[Receive RemoteNotification]:%@\n\n",userInfo);
        completionHandler(UIBackgroundFetchResult.NewData);
    }
    

    // MARK: - GeTuiSdkDelegate
    
    /** SDK启动成功返回cid */
    func GeTuiSdkDidRegisterClient(clientId: String!) {
        // [4-EXT-1]: 个推SDK已注册，返回clientId
        NSLog("\n>>>[GeTuiSdk RegisterClient]:%@\n\n", clientId);
    }

    /** SDK遇到错误回调 */
    func GeTuiSdkDidOccurError(error: NSError!) {
        // [EXT]:个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
        NSLog("\n>>>[GeTuiSdk error]:%@\n\n", error.localizedDescription);
    }

    /** SDK收到sendMessage消息回调 */
    func GeTuiSdkDidSendMessage(messageId: String!, result: Int32) {
        // [4-EXT]:发送上行消息结果反馈
        let msg:String = "sendmessage=\(messageId),result=\(result)";
        NSLog("\n>>>[GeTuiSdk DidSendMessage]:%@\n\n",msg);
    }

    func GeTuiSdkDidReceivePayloadData(payloadData: NSData!, andTaskId taskId: String!, andMsgId msgId: String!, andOffLine offLine: Bool, fromGtAppId appId: String!) {
        
        var payloadMsg = "";
        if((payloadData) != nil) {
            payloadMsg = String.init(data: payloadData, encoding: NSUTF8StringEncoding)!;
        }
        
        let msg:String = "Receive Payload: \(payloadMsg), taskId:\(taskId), messageId:\(msgId)";
        
        NSLog("\n>>>[GeTuiSdk DidReceivePayload]:%@\n\n",msg);
    }

    
    
    /**
     初始化友盟统计
     */
    
    func appConfigUMobClickSDK() {
        
        UMAnalyticsConfig.sharedInstance().appKey = UMAPPKey
        MobClick.startWithConfigure(UMAnalyticsConfig.sharedInstance())
      
    }
    
    func compareIsNewVersionApp() {
                
        NetWebApi.shareApi.netGetRequest(WebApiMethod.LiveApp.description, modelObject: AppVersionResponse.self, successHandler: { (response) in
            
            if (ez.appVersion ?? "99.99").compareIsNewVersionStr(response.version) == false {
                
                let cancelAction = UIAlertAction(title: L10n.AlertCancelActionTitle.string, style: .Cancel) { (action) in }
                
                let updateAction = UIAlertAction(title: L10n.AlertUpdateActionTitle.string, style: .Default) { (action) in
                    
                    UIApplication.sharedApplication().openURL(NSURL(string: CavyDefine.cavyAppStoreAddr)!)
                    
                }
                
                let versionAlert = UIAlertController(title: L10n.AlertAppUpdateTitle.string, message: response.description, preferredStyle: .Alert)
                
                versionAlert.addAction(cancelAction)
                versionAlert.addAction(updateAction)
                
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(versionAlert, animated: true, completion: nil)
            
            }
            
        }) { (error) in
            Log.error(error.msg)
        }
    }
    
    /**
     5,5c,5s适配
     */
    func appFitWithDevice() {
        
        if UIDevice.isPhone5() {
            
            timeButtonHeight = 40
            subTimeButtonHeight = 40
            chartTopHeigh = 20
            chartBottomHeigh = 20
            chartViewHight = 230
            listcellHight = 44
            
        }
        
    }
    
    /**
     首页设置
     
     - author: sim cai
     - date: 2016-06-01
     */
    func setRootViewController() {
        if CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId.isEmpty {
            return
        }
        
        
        let bindBandKey = "CavyAppMAC_" + CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId
        BindBandCtrl.bandMacAddress = CavyDefine.bindBandInfos.bindBandInfo.userBindBand[bindBandKey] ?? NSData()
        
        window?.rootViewController = StoryboardScene.Home.instantiateRootView()
        
    }
    

    
    /**
     分享SDK
     
     - author: sim cai
     - date: 2016-06-01
     */
    func registerShareSdk() {
        
        ShareSDK.registerApp(CavyDefine.shareSDKAppKey)
        
        // 新浪微博
        ShareSDK.connectSinaWeiboWithAppKey(CavyDefine.sinaShareAppKey, appSecret: CavyDefine.sinaShareAppSecret, redirectUri: CavyDefine.sinaShareAppRedirectUri, weiboSDKCls: WeiboSDK.classForCoder())
        
        // QQ
        ShareSDK.connectQQWithAppId(CavyDefine.qqShareAppKey, qqApiCls: QQApiInterface.classForCoder())
        
        // Wechat
        ShareSDK.connectWeChatTimelineWithAppId(CavyDefine.wechatShareAppKey, appSecret: CavyDefine.wechatShareAppSecret, wechatCls: WXApi.classForCoder())
        ShareSDK.connectWeChatSessionWithAppId(CavyDefine.wechatShareAppKey, appSecret: CavyDefine.wechatShareAppSecret, wechatCls: WXApi.classForCoder())
        
    }
    

    
    /**
     realm 数据合并配置
     
     - author: sim cai
     - date: 2016-06-01
     */
    func realmConfig() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: UInt64(ez.appBuild!)!, migrationBlock: { migration, oldSchemaVersion in
            
            if oldSchemaVersion > 6 {
                return
            }
            
            migration.enumerate(FriendInfoRealm.className()) { (oldObject, newObject) in
                
                let nikeName = oldObject!["nikeName"] as! String
                newObject!["fullName"] = nikeName.chineseToSpell() + nikeName
                
            }
            
        })
        
    }
    

    
    /**
     获取用户经纬度 用于事件统计接口
     */
    func setUserDefaultCoordinate() {
        
        SCLocationManager.shareInterface.startUpdateLocation { coordinate in
            
            CavyDefine.userCoordinate.latitude = coordinate.latitude.toString
            CavyDefine.userCoordinate.longitude = coordinate.longitude.toString
            
        }

    }
    

#if UITEST
    
    func uiTestStub() {
    
//        stub(isMethodPOST()) { _ in
//            let stubPath = OHPathForFile("GetFrendListResult.json", self.dynamicType)
//            return fixture(stubPath!, headers: ["Content-Type": "application/json"])
//        }
        
        if NSProcessInfo.processInfo().arguments.contains("AccountPageSwitchUITests") {
            
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = ""
            
        }
        
        if NSProcessInfo.processInfo().arguments.contains("ContactsAccountInfoUItests") {
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = "56d6ea3bd34635186c60492b"
        }

    
        if NSProcessInfo.processInfo().arguments.contains("STUB_HTTP_SIGN_IN") {
    
            // setup HTTP stubs for tests
            stub(isMethodPOST()) { _ in
            let stubPath = OHPathForFile("Sign_In_Ok.json", self.dynamicType)
            return fixture(stubPath!, headers: ["Content-Type": "application/json"])
            }
            
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = ""
            
        }

        if NSProcessInfo.processInfo().arguments.contains("STUB_HTTP_SIGN_UP") {

            // setup HTTP stubs for tests
            stub(isMethodPOST()) { _ in
                let stubPath = OHPathForFile("Sign_Up_Ok.json", self.dynamicType)
                return fixture(stubPath!, headers: ["Content-Type": "application/json"])
            }
            
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = ""
        }
    
        if NSProcessInfo.processInfo().arguments.contains("STUB_HTTP_COMMON_RESULT_OK") {
    
            // setup HTTP stubs for tests
            stub(isMethodPOST()) { _ in
                let stubPath = OHPathForFile("Sign_Up_Ok.json", self.dynamicType)
                return fixture(stubPath!, headers: ["Content-Type": "application/json"])
            }
            
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = ""
        }
        
        if NSProcessInfo.processInfo().arguments.contains("AccountInfoSecurityUITest") {
            
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = "56d6ea3bd34635186c60492b"
            
        }
        
        if NSProcessInfo.processInfo().arguments.contains("AlarmClockUITest") {
            
            CavyDefine.loginUserBaseInfo.loginUserInfo.loginUserId = "56d6ea3bd34635186c60492b"
            
        }
    
    }
    
#endif

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // 进入后台和杀死进程(统计事件)
        EventStatisticsApi.shareApi.uploadEventInfo(ActivityEventType.AppQuit)
                
        keepAlive = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(AppDelegate.tickDown), userInfo: nil, repeats: true)
        
    }

    func tickDown() {
        LifeBandCtrl.shareInterface.getBandElectric { [unowned self] electric in
    
        }

    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        // 只有 打开蓝牙并且连接手环 自动刷新的处理
        if LifeBandBle.shareInterface.centraManager?.state == .PoweredOn && LifeBandBle.shareInterface.getConnectState() == .Connected {
        
            NSNotificationCenter.defaultCenter().postNotificationName(RefreshStyle.BeginRefresh.rawValue, object: nil)
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName(NotificationName.HomeRefreshDate.rawValue, object: nil)
        EventStatisticsApi.shareApi.uploadEventInfo(ActivityEventType.AppOpen)
        
        keepAlive.invalidate()
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        if LifeBandBle.shareInterface.centraManager?.state == .PoweredOn && LifeBandBle.shareInterface.getConnectState() == .Connected {
            
            EventStatisticsApi.shareApi.uploadEventInfo(ActivityEventType.BandDisconnect)
            EventStatisticsApi.shareApi.uploadUMeng(ActivityEventType.BandDisconnect)
        }
        
    }

    // MARK: - 如果使用SSO（可以简单理解成跳客户端授权），以下方法是必要的
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        
        return ShareSDK.handleOpenURL(url, wxDelegate: self)
        
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return ShareSDK.handleOpenURL(url, sourceApplication: sourceApplication, annotation: annotation, wxDelegate: self)
        
    }

}
