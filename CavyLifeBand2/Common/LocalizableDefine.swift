// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

enum L10n {
  /// 请求参数错误
  case WebErrorCode1000
  /// 用户名或密码错误
  case WebErrorCode1001
  /// 手机号码错误
  case WebErrorCode1002
  /// 验证码错误
  case WebErrorCode1003
  /// 修改用户信息失败
  case WebErrorCode1004
  /// 用户已存在
  case WebErrorCode1005
  /// 用户名错误或不存在
  case WebErrorCode1006
  /// 短信验证码发送失败
  case WebErrorCode1007
  /// 系统错误
  case WebErrorCode5001
  /// 数据库错误
  case WebErrorCode5002
  /// 网络不给力，请检查你的网络
  case UserModuleErrorCodeNetError
  /// 服务器返回错误
  case UserModuleErrorCodeNetAPIError
  /// 手机号码错误
  case UserModuleErrorCodePhoneError
  /// 邮箱格式错误
  case UserModuleErrorCodeEmailError
  /// 密码6位数或密码大于16位数
  case UserModuleErrorCodePasswdError
  /// 验证码错误
  case UserModuleErrorCodeSecurityError
  /// 用户名格式错误
  case UserModuleErrorCodeUserNameError
  /// 手机号码不能为空
  case UserModuleErrorCodePhoneNil
  /// 邮箱不能为空
  case UserModuleErrorCodeEmailNil
  /// 密码不能为空
  case UserModuleErrorCodePasswdNil
  /// 验证码不能为空
  case UserModuleErrorCodeSecurityNil
  /// 用户名不能为空
  case UserModuleErrorCodeUserNameNil
  /// 登入
  case MainPageSignInBtn
  /// 加入豚鼠
  case MainPageSignUpBtn
  /// 登录
  case SignInSignInBtn
  /// 手机/邮箱
  case SignInUserNameTextField
  /// 密码
  case SignInPasswdTextField
  /// 准备开始
  case SignInTitle
  /// 注册
  case SignInSignUpItemBtn
  /// 忘记了密码？
  case SignInForgotPasswdBtn
  /// 邮箱
  case SignUpPhoneRightItemBtn
  /// 手机
  case SignUpEmailRightItemBtn
  /// 加入豚鼠
  case SignUpTitle
  /// 手机
  case SignUpPhoneNumTextField
  /// 邮箱
  case SignUpEmailTextField
  /// 验证码
  case SignUpSafetyCodeTextField
  /// 发送验证码
  case SignUpSendSafetyCode
  /// 我们已经阅读并接受
  case SignUpProcotolViewTitle
  /// 《豚鼠科技服务协议》
  case SignUpProcotolViewBtn
  /// 注册
  case SignUpSignUpBtn
  /// 请先阅读《豚鼠科技服务协议》
  case SignUpReadProcotol
  /// 我的信息
  case GuideMyInfo
  /// 我是
  case GuideMine
  /// 生日
  case GuideBirthday
  /// 身高
  case GuideHeight
  /// 体重
  case GuideWeight
  /// 目标
  case GuideGoal
  /// 运动步数
  case GuideGoalStep
  /// 睡眠
  case GuideGoalSleep
  /// 步
  case GuideStep
  /// 平均
  case GuideAverage
  /// 推荐
  case GuideRecommend
  /// 可以更好地帮助健康统计哦
  case GuideIntroduce
  /// 设置
  case GuideSetting
  /// 跳过
  case GuidePassButton
  /// 开启智能通知
  case GuideOpenNotice
  /// 随时关注我的健康生活
  case GuideOpenNoticeInfo
  /// 开启位置共享
  case GuideOpenLocationShare
  /// 告诉豚鼠你的位置，更有安全服务！
  case GuideOpenLocationShareInfo
  /// 连接手环
  case GuideLinkCavy
  /// 打开蓝牙
  case GuideOpenBluetooth
  /// 手机蓝牙打开后才能成功连接手环
  case GuideOpenBluetoothInfo
  /// 开启手环
  case GuideOpenCavy
  /// 没有灯充电试试看
  case GuideOpenCavySugg
  /// 按下手环按钮等待红灯亮起即打开手环
  case GuideOpenCavyInfo
  /// 正在连接...
  case GuideLinking
  /// 配对成功
  case GuidePairSuccess
  /// 开始健康之旅吧
  case GuidePairSuccessInfo
  /// 无法配对
  case GuidePairFail
  /// 确保手环有电，并且位于手机的连接范围
  case GuidePairFailInfo
  /// 忘记密码了?
  case ForgotTitle
  /// 新密码
  case ForgotPasswdTextField
  /// 且慢,我想起来了!
  case ForgotBackTextBtn
  /// 完成
  case ForgotFinish
  /// 拍照
  case CameraPhoto
  /// 摄影
  case CameraVideo
  /// 取消
  case CameraBack
  /// 目标
  case HomeLifeListTitleTarget
  /// 信息公开
  case HomeLifeListTitleInfoOpen
  /// 好友
  case HomeLifeListTitleFriend
  /// PK
  case HomeLifeListTitlePK
  /// 关于
  case HomeLifeListTitleAbout
  /// 帮助与反馈
  case HomeLifeListTitleHelp
  /// 相关APP
  case HomeLifeListTitleRelated
  /// 生活豚鼠
  case ContactsListCellCavy
  /// 搜索
  case ContactsSearchBarSearch
  /// 联系人
  case ContactsTitle
  /// 新的朋友
  case ContactsNewFriendsCell
  /// 添加好友
  case ContactsAddFriendsCell
  ///   搜索你得联系人
  case ContactsSearchplaceHolder
  /// 删除
  case ContactsListCellDelete
  /// 关注
  case ContactsListCellCare
  /// 取消关注
  case ContactsListCellUndoCare
  /// 添加
  case ContactsListCellAdd
  /// 同意
  case ContactsListCellAgree
  /// 已发送
  case ContactsListCellAlreaydAdd
  /// 通讯录好友
  case ContactsSearchPhoneNum
  /// 推荐好友
  case ContactsSearchRecommendNum
  /// 附近好友
  case ContactsSearchNearbyNum
  ///   搜索新的好友
  case ContactsSearchPlaceHolder
  /// 下拉换一批
  case ContactsSearchDropRefresh
  /// 发送验证申请，等待对方通过
  case ContactsRequestPlaceHolder
  /// 发送
  case ContactsRequestSendButton
  /// 城市
  case ContactsShowInfoCity
  /// 地址
  case ContactsShowInfoAddress
  /// 年龄
  case ContactsShowInfoOld
  /// 性别
  case ContactsShowInfoGender
  /// 女
  case ContactsGenderGirl
  /// 男
  case ContactsGenderBoy
  /// 设置备注
  case ContactsShowInfoNotesName
  /// 点击修改备注
  case ContactsShowInfoTransformNotes
  /// 身高
  case ContactsShowInfoHeight
  /// 体重
  case ContactsShowInfoWeight
  /// 生日
  case ContactsShowInfoBirth
  /// PK
  case ContactsShowInfoPK
  /// 计步
  case ContactsShowInfoStep
  /// 睡眠
  case ContactsShowInfoSleep
  /// 成就
  case ContactsShowInfoAchievement
  /// 您已累计走了
  case ContactsShowInfoAchievementNum
  /// 输入备注名
  case ContactsChangeNotesNamePlaceHolder
  /// 确定
  case ContactsChangeNotesNameButton
  /// 更改的昵称
  case ContactsChangeSelfNamePlaceHolder
  /// 手环振动提醒 取消传统声音唤醒体系
  case AlarmClockIntelligentClockTableFooterInfo
  /// 智能闹钟
  case AlarmClockTitle
  /// 智能唤醒
  case AlarmClockAwakeTitle
  /// 允许你闹钟在目标唤醒时间之前30分钟内将我从浅度睡眠中唤醒，让我更轻松的起床。
  case AlarmClockAwakeDescription
  /// 闹钟周期
  case AlarmClockAlarmCircleTitle
  /// 小提示
  case AlarmClockAlarmCircleSubTitle
  /// 闹钟振动过程中，按一下手环按钮即可停止振动。手环检测到你已起床，即会停止振动。
  case AlarmClockAlarmCircleDescription
  /// 删除
  case AlarmClockDeleteBtnTitle
  /// 请选择闹钟周期
  case AlarmClockAlarmCircleAlertTitle
  /// 安全
  case SettingSafetyTitle
  /// 点击添加
  case SettingSafetyTableCellContactButton
  /// 紧急联系人
  case SettingSafetyTableCellContactTitle
  /// GPS定位
  case SettingSafetyTableCellGPSTitle
  /// 紧急报警
  case SettingSafetyTableFooterTitle
  /// 紧急情况下，连续按4下按钮，紧急联系人即可收到豚鼠为您发送的请求信息及GPS定位消息。
  case SettingSafetyTableFooterInfo
  /// 来电提醒
  case SettingReminderPhoneCallTitle
  /// 秒未接提醒
  case SettingReminderPhoneCallDescription
  /// 短信提醒
  case SettingReminderMessageTitle
  /// 振动一次通知提醒
  case SettingReminderMessageDescription
  /// 断线手环自动重连
  case SettingReminderReconnectTitle
  /// 3
  case SettingReminderReconnectType
  /// 2
  case SettingReminderMessageType
  /// 1
  case SettingReminderPhoneType
}

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .WebErrorCode1000:
        return L10n.tr("WebErrorCode.1000")
      case .WebErrorCode1001:
        return L10n.tr("WebErrorCode.1001")
      case .WebErrorCode1002:
        return L10n.tr("WebErrorCode.1002")
      case .WebErrorCode1003:
        return L10n.tr("WebErrorCode.1003")
      case .WebErrorCode1004:
        return L10n.tr("WebErrorCode.1004")
      case .WebErrorCode1005:
        return L10n.tr("WebErrorCode.1005")
      case .WebErrorCode1006:
        return L10n.tr("WebErrorCode.1006")
      case .WebErrorCode1007:
        return L10n.tr("WebErrorCode.1007")
      case .WebErrorCode5001:
        return L10n.tr("WebErrorCode.5001")
      case .WebErrorCode5002:
        return L10n.tr("WebErrorCode.5002")
      case .UserModuleErrorCodeNetError:
        return L10n.tr("UserModuleErrorCode.NetError")
      case .UserModuleErrorCodeNetAPIError:
        return L10n.tr("UserModuleErrorCode.NetAPIError")
      case .UserModuleErrorCodePhoneError:
        return L10n.tr("UserModuleErrorCode.PhoneError")
      case .UserModuleErrorCodeEmailError:
        return L10n.tr("UserModuleErrorCode.EmailError")
      case .UserModuleErrorCodePasswdError:
        return L10n.tr("UserModuleErrorCode.PasswdError")
      case .UserModuleErrorCodeSecurityError:
        return L10n.tr("UserModuleErrorCode.SecurityError")
      case .UserModuleErrorCodeUserNameError:
        return L10n.tr("UserModuleErrorCode.UserNameError")
      case .UserModuleErrorCodePhoneNil:
        return L10n.tr("UserModuleErrorCode.PhoneNil")
      case .UserModuleErrorCodeEmailNil:
        return L10n.tr("UserModuleErrorCode.EmailNil")
      case .UserModuleErrorCodePasswdNil:
        return L10n.tr("UserModuleErrorCode.PasswdNil")
      case .UserModuleErrorCodeSecurityNil:
        return L10n.tr("UserModuleErrorCode.SecurityNil")
      case .UserModuleErrorCodeUserNameNil:
        return L10n.tr("UserModuleErrorCode.UserNameNil")
      case .MainPageSignInBtn:
        return L10n.tr("MainPage.SignInBtn")
      case .MainPageSignUpBtn:
        return L10n.tr("MainPage.SignUpBtn")
      case .SignInSignInBtn:
        return L10n.tr("SignIn.SignInBtn")
      case .SignInUserNameTextField:
        return L10n.tr("SignIn.UserNameTextField")
      case .SignInPasswdTextField:
        return L10n.tr("SignIn.PasswdTextField")
      case .SignInTitle:
        return L10n.tr("SignIn.title")
      case .SignInSignUpItemBtn:
        return L10n.tr("SignIn.SignUpItemBtn")
      case .SignInForgotPasswdBtn:
        return L10n.tr("SignIn.ForgotPasswdBtn")
      case .SignUpPhoneRightItemBtn:
        return L10n.tr("SignUp.PhoneRightItemBtn")
      case .SignUpEmailRightItemBtn:
        return L10n.tr("SignUp.EmailRightItemBtn")
      case .SignUpTitle:
        return L10n.tr("SignUp.Title")
      case .SignUpPhoneNumTextField:
        return L10n.tr("SignUp.PhoneNumTextField")
      case .SignUpEmailTextField:
        return L10n.tr("SignUp.EmailTextField")
      case .SignUpSafetyCodeTextField:
        return L10n.tr("SignUp.SafetyCodeTextField")
      case .SignUpSendSafetyCode:
        return L10n.tr("SignUp.SendSafetyCode")
      case .SignUpProcotolViewTitle:
        return L10n.tr("SignUp.ProcotolViewTitle")
      case .SignUpProcotolViewBtn:
        return L10n.tr("SignUp.ProcotolViewBtn")
      case .SignUpSignUpBtn:
        return L10n.tr("SignUp.SignUpBtn")
      case .SignUpReadProcotol:
        return L10n.tr("SignUp.ReadProcotol")
      case .GuideMyInfo:
        return L10n.tr("Guide.MyInfo")
      case .GuideMine:
        return L10n.tr("Guide.Mine")
      case .GuideBirthday:
        return L10n.tr("Guide.Birthday")
      case .GuideHeight:
        return L10n.tr("Guide.Height")
      case .GuideWeight:
        return L10n.tr("Guide.Weight")
      case .GuideGoal:
        return L10n.tr("Guide.Goal")
      case .GuideGoalStep:
        return L10n.tr("Guide.GoalStep")
      case .GuideGoalSleep:
        return L10n.tr("Guide.GoalSleep")
      case .GuideStep:
        return L10n.tr("Guide.Step")
      case .GuideAverage:
        return L10n.tr("Guide.Average")
      case .GuideRecommend:
        return L10n.tr("Guide.Recommend")
      case .GuideIntroduce:
        return L10n.tr("Guide.Introduce")
      case .GuideSetting:
        return L10n.tr("Guide.Setting")
      case .GuidePassButton:
        return L10n.tr("Guide.PassButton")
      case .GuideOpenNotice:
        return L10n.tr("Guide.OpenNotice")
      case .GuideOpenNoticeInfo:
        return L10n.tr("Guide.OpenNoticeInfo")
      case .GuideOpenLocationShare:
        return L10n.tr("Guide.OpenLocationShare")
      case .GuideOpenLocationShareInfo:
        return L10n.tr("Guide.OpenLocationShareInfo")
      case .GuideLinkCavy:
        return L10n.tr("Guide.LinkCavy")
      case .GuideOpenBluetooth:
        return L10n.tr("Guide.OpenBluetooth")
      case .GuideOpenBluetoothInfo:
        return L10n.tr("Guide.OpenBluetoothInfo")
      case .GuideOpenCavy:
        return L10n.tr("Guide.OpenCavy")
      case .GuideOpenCavySugg:
        return L10n.tr("Guide.OpenCavySugg")
      case .GuideOpenCavyInfo:
        return L10n.tr("Guide.OpenCavyInfo")
      case .GuideLinking:
        return L10n.tr("Guide.Linking")
      case .GuidePairSuccess:
        return L10n.tr("Guide.PairSuccess")
      case .GuidePairSuccessInfo:
        return L10n.tr("Guide.PairSuccessInfo")
      case .GuidePairFail:
        return L10n.tr("Guide.PairFail")
      case .GuidePairFailInfo:
        return L10n.tr("Guide.PairFailInfo")
      case .ForgotTitle:
        return L10n.tr("Forgot.Title")
      case .ForgotPasswdTextField:
        return L10n.tr("Forgot.PasswdTextField")
      case .ForgotBackTextBtn:
        return L10n.tr("Forgot.BackTextBtn")
      case .ForgotFinish:
        return L10n.tr("Forgot.finish")
      case .CameraPhoto:
        return L10n.tr("Camera.Photo")
      case .CameraVideo:
        return L10n.tr("Camera.Video")
      case .CameraBack:
        return L10n.tr("Camera.Back")
      case .HomeLifeListTitleTarget:
        return L10n.tr("Home.LifeList.Title.Target")
      case .HomeLifeListTitleInfoOpen:
        return L10n.tr("Home.LifeList.Title.InfoOpen")
      case .HomeLifeListTitleFriend:
        return L10n.tr("Home.LifeList.Title.Friend")
      case .HomeLifeListTitlePK:
        return L10n.tr("Home.LifeList.Title.PK")
      case .HomeLifeListTitleAbout:
        return L10n.tr("Home.LifeList.Title.About")
      case .HomeLifeListTitleHelp:
        return L10n.tr("Home.LifeList.Title.Help")
      case .HomeLifeListTitleRelated:
        return L10n.tr("Home.LifeList.Title.Related")
      case .ContactsListCellCavy:
        return L10n.tr("Contacts.ListCell.Cavy")
      case .ContactsSearchBarSearch:
        return L10n.tr("Contacts.SearchBar.Search")
      case .ContactsTitle:
        return L10n.tr("Contacts.Title")
      case .ContactsNewFriendsCell:
        return L10n.tr("Contacts.NewFriendsCell")
      case .ContactsAddFriendsCell:
        return L10n.tr("Contacts.AddFriendsCell")
      case .ContactsSearchplaceHolder:
        return L10n.tr("Contacts.SearchplaceHolder")
      case .ContactsListCellDelete:
        return L10n.tr("Contacts.ListCell.Delete")
      case .ContactsListCellCare:
        return L10n.tr("Contacts.ListCell.Care")
      case .ContactsListCellUndoCare:
        return L10n.tr("Contacts.ListCell.UndoCare")
      case .ContactsListCellAdd:
        return L10n.tr("Contacts.ListCell.Add")
      case .ContactsListCellAgree:
        return L10n.tr("Contacts.ListCell.Agree")
      case .ContactsListCellAlreaydAdd:
        return L10n.tr("Contacts.ListCell.AlreaydAdd")
      case .ContactsSearchPhoneNum:
        return L10n.tr("Contacts.Search.PhoneNum")
      case .ContactsSearchRecommendNum:
        return L10n.tr("Contacts.Search.RecommendNum")
      case .ContactsSearchNearbyNum:
        return L10n.tr("Contacts.Search.NearbyNum")
      case .ContactsSearchPlaceHolder:
        return L10n.tr("Contacts.Search.placeHolder")
      case .ContactsSearchDropRefresh:
        return L10n.tr("Contacts.Search.dropRefresh")
      case .ContactsRequestPlaceHolder:
        return L10n.tr("Contacts.Request.placeHolder")
      case .ContactsRequestSendButton:
        return L10n.tr("Contacts.Request.SendButton")
      case .ContactsShowInfoCity:
        return L10n.tr("Contacts.ShowInfo.city")
      case .ContactsShowInfoAddress:
        return L10n.tr("Contacts.ShowInfo.Address")
      case .ContactsShowInfoOld:
        return L10n.tr("Contacts.ShowInfo.old")
      case .ContactsShowInfoGender:
        return L10n.tr("Contacts.ShowInfo.Gender")
      case .ContactsGenderGirl:
        return L10n.tr("Contacts.Gender.Girl")
      case .ContactsGenderBoy:
        return L10n.tr("Contacts.Gender.Boy")
      case .ContactsShowInfoNotesName:
        return L10n.tr("Contacts.ShowInfo.NotesName")
      case .ContactsShowInfoTransformNotes:
        return L10n.tr("Contacts.ShowInfo.TransformNotes")
      case .ContactsShowInfoHeight:
        return L10n.tr("Contacts.ShowInfo.Height")
      case .ContactsShowInfoWeight:
        return L10n.tr("Contacts.ShowInfo.Weight")
      case .ContactsShowInfoBirth:
        return L10n.tr("Contacts.ShowInfo.Birth")
      case .ContactsShowInfoPK:
        return L10n.tr("Contacts.ShowInfo.PK")
      case .ContactsShowInfoStep:
        return L10n.tr("Contacts.ShowInfo.Step")
      case .ContactsShowInfoSleep:
        return L10n.tr("Contacts.ShowInfo.Sleep")
      case .ContactsShowInfoAchievement:
        return L10n.tr("Contacts.ShowInfo.Achievement")
      case .ContactsShowInfoAchievementNum:
        return L10n.tr("Contacts.ShowInfo.AchievementNum")
      case .ContactsChangeNotesNamePlaceHolder:
        return L10n.tr("Contacts.ChangeNotesName.PlaceHolder")
      case .ContactsChangeNotesNameButton:
        return L10n.tr("Contacts.ChangeNotesName.Button")
      case .ContactsChangeSelfNamePlaceHolder:
        return L10n.tr("Contacts.ChangeSelfName.PlaceHolder")
      case .AlarmClockIntelligentClockTableFooterInfo:
        return L10n.tr("AlarmClock.IntelligentClockTableFooter.Info")
      case .AlarmClockTitle:
        return L10n.tr("AlarmClock.Title")
      case .AlarmClockAwakeTitle:
        return L10n.tr("AlarmClock.Awake.Title")
      case .AlarmClockAwakeDescription:
        return L10n.tr("AlarmClock.Awake.Description")
      case .AlarmClockAlarmCircleTitle:
        return L10n.tr("AlarmClock.AlarmCircle.Title")
      case .AlarmClockAlarmCircleSubTitle:
        return L10n.tr("AlarmClock.AlarmCircle.SubTitle")
      case .AlarmClockAlarmCircleDescription:
        return L10n.tr("AlarmClock.AlarmCircle.Description")
      case .AlarmClockDeleteBtnTitle:
        return L10n.tr("AlarmClock.DeleteBtn.Title")
      case .AlarmClockAlarmCircleAlertTitle:
        return L10n.tr("AlarmClock.AlarmCircle.AlertTitle")
      case .SettingSafetyTitle:
        return L10n.tr("Setting.Safety.Title")
      case .SettingSafetyTableCellContactButton:
        return L10n.tr("Setting.SafetyTableCell.ContactButton")
      case .SettingSafetyTableCellContactTitle:
        return L10n.tr("Setting.SafetyTableCell.ContactTitle")
      case .SettingSafetyTableCellGPSTitle:
        return L10n.tr("Setting.SafetyTableCell.GPSTitle")
      case .SettingSafetyTableFooterTitle:
        return L10n.tr("Setting.SafetyTableFooter.Title")
      case .SettingSafetyTableFooterInfo:
        return L10n.tr("Setting.SafetyTableFooter.Info")
      case .SettingReminderPhoneCallTitle:
        return L10n.tr("Setting.ReminderPhoneCall.Title")
      case .SettingReminderPhoneCallDescription:
        return L10n.tr("Setting.ReminderPhoneCall.Description")
      case .SettingReminderMessageTitle:
        return L10n.tr("Setting.ReminderMessage.Title")
      case .SettingReminderMessageDescription:
        return L10n.tr("Setting.ReminderMessage.Description")
      case .SettingReminderReconnectTitle:
        return L10n.tr("Setting.ReminderReconnect.Title")
      case .SettingReminderReconnectType:
        return L10n.tr("Setting.ReminderReconnect.Type")
      case .SettingReminderMessageType:
        return L10n.tr("Setting.ReminderMessage.Type")
      case .SettingReminderPhoneType:
        return L10n.tr("Setting.ReminderPhone.Type")
    }
  }

  private static func tr(key: String, _ args: CVarArgType...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: NSLocale.currentLocale(), arguments: args)
  }
}

func tr(key: L10n) -> String {
  return key.string
}

