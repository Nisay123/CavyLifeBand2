// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum AccountInfo: String, StoryboardSceneType {
    static let storyboardName = "AccountInfo"

    case ContactsAccountInfoVCScene = "ContactsAccountInfoVC"
    static func instantiateContactsAccountInfoVC() -> ContactsAccountInfoVC {
      guard let vc = StoryboardScene.AccountInfo.ContactsAccountInfoVCScene.viewController() as? ContactsAccountInfoVC
      else {
        fatalError("ViewController 'ContactsAccountInfoVC' is not of the expected class ContactsAccountInfoVC.")
      }
      return vc
    }
  }
  enum AlarmClock: String, StoryboardSceneType {
    static let storyboardName = "AlarmClock"

    case AddClockViewControllerScene = "AddClockViewController"
    static func instantiateAddClockViewController() -> AddClockViewController {
      guard let vc = StoryboardScene.AlarmClock.AddClockViewControllerScene.viewController() as? AddClockViewController
      else {
        fatalError("ViewController 'AddClockViewController' is not of the expected class AddClockViewController.")
      }
      return vc
    }

    case IntelligentClockViewControllerScene = "IntelligentClockViewController"
    static func instantiateIntelligentClockViewController() -> IntelligentClockViewController {
      guard let vc = StoryboardScene.AlarmClock.IntelligentClockViewControllerScene.viewController() as? IntelligentClockViewController
      else {
        fatalError("ViewController 'IntelligentClockViewController' is not of the expected class IntelligentClockViewController.")
      }
      return vc
    }

    case RemindersSettingViewControllerScene = "RemindersSettingViewController"
    static func instantiateRemindersSettingViewController() -> RemindersSettingViewController {
      guard let vc = StoryboardScene.AlarmClock.RemindersSettingViewControllerScene.viewController() as? RemindersSettingViewController
      else {
        fatalError("ViewController 'RemindersSettingViewController' is not of the expected class RemindersSettingViewController.")
      }
      return vc
    }

    case SafetySettingViewControllerScene = "SafetySettingViewController"
    static func instantiateSafetySettingViewController() -> SafetySettingViewController {
      guard let vc = StoryboardScene.AlarmClock.SafetySettingViewControllerScene.viewController() as? SafetySettingViewController
      else {
        fatalError("ViewController 'SafetySettingViewController' is not of the expected class SafetySettingViewController.")
      }
      return vc
    }
  }
  enum Camera: String, StoryboardSceneType {
    static let storyboardName = "Camera"

    case CustomCameraViewScene = "CustomCameraView"
    static func instantiateCustomCameraView() -> CustomCamera {
      guard let vc = StoryboardScene.Camera.CustomCameraViewScene.viewController() as? CustomCamera
      else {
        fatalError("ViewController 'CustomCameraView' is not of the expected class CustomCamera.")
      }
      return vc
    }

    case PhotoViewScene = "PhotoView"
    static func instantiatePhotoView() -> PhotoView {
      guard let vc = StoryboardScene.Camera.PhotoViewScene.viewController() as? PhotoView
      else {
        fatalError("ViewController 'PhotoView' is not of the expected class PhotoView.")
      }
      return vc
    }
  }
  enum Contacts: String, StoryboardSceneType {
    static let storyboardName = "Contacts"

    case ContactsAddFriendVCScene = "ContactsAddFriendVC"
    static func instantiateContactsAddFriendVC() -> ContactsAddFriendVC {
      guard let vc = StoryboardScene.Contacts.ContactsAddFriendVCScene.viewController() as? ContactsAddFriendVC
      else {
        fatalError("ViewController 'ContactsAddFriendVC' is not of the expected class ContactsAddFriendVC.")
      }
      return vc
    }

    case ContactsFriendInfoVCScene = "ContactsFriendInfoVC"
    static func instantiateContactsFriendInfoVC() -> ContactsFriendInfoVC {
      guard let vc = StoryboardScene.Contacts.ContactsFriendInfoVCScene.viewController() as? ContactsFriendInfoVC
      else {
        fatalError("ViewController 'ContactsFriendInfoVC' is not of the expected class ContactsFriendInfoVC.")
      }
      return vc
    }

    case ContactsFriendListVCScene = "ContactsFriendListVC"
    static func instantiateContactsFriendListVC() -> ContactsFriendListVC {
      guard let vc = StoryboardScene.Contacts.ContactsFriendListVCScene.viewController() as? ContactsFriendListVC
      else {
        fatalError("ViewController 'ContactsFriendListVC' is not of the expected class ContactsFriendListVC.")
      }
      return vc
    }

    case ContactsNewFriendVCScene = "ContactsNewFriendVC"
    static func instantiateContactsNewFriendVC() -> ContactsNewFriendVC {
      guard let vc = StoryboardScene.Contacts.ContactsNewFriendVCScene.viewController() as? ContactsNewFriendVC
      else {
        fatalError("ViewController 'ContactsNewFriendVC' is not of the expected class ContactsNewFriendVC.")
      }
      return vc
    }

    case ContactsPersonInfoVCScene = "ContactsPersonInfoVC"
    static func instantiateContactsPersonInfoVC() -> ContactsPersonInfoVC {
      guard let vc = StoryboardScene.Contacts.ContactsPersonInfoVCScene.viewController() as? ContactsPersonInfoVC
      else {
        fatalError("ViewController 'ContactsPersonInfoVC' is not of the expected class ContactsPersonInfoVC.")
      }
      return vc
    }

    case ContactsReqFriendVCScene = "ContactsReqFriendVC"
    static func instantiateContactsReqFriendVC() -> ContactsReqFriendVC {
      guard let vc = StoryboardScene.Contacts.ContactsReqFriendVCScene.viewController() as? ContactsReqFriendVC
      else {
        fatalError("ViewController 'ContactsReqFriendVC' is not of the expected class ContactsReqFriendVC.")
      }
      return vc
    }

    case SearchResultViewScene = "SearchResultView"
    static func instantiateSearchResultView() -> UITableViewController {
      guard let vc = StoryboardScene.Contacts.SearchResultViewScene.viewController() as? UITableViewController
      else {
        fatalError("ViewController 'SearchResultView' is not of the expected class UITableViewController.")
      }
      return vc
    }
  }
  enum Guide: String, StoryboardSceneType {
    static let storyboardName = "Guide"

    case GuideViewScene = "GuideView"
    static func instantiateGuideView() -> GuideViewController {
      guard let vc = StoryboardScene.Guide.GuideViewScene.viewController() as? GuideViewController
      else {
        fatalError("ViewController 'GuideView' is not of the expected class GuideViewController.")
      }
      return vc
    }
  }
  enum Home: String, StoryboardSceneType {
    static let storyboardName = "Home"

    case HomeViewScene = "HomeView"
    static func instantiateHomeView() -> HomeViewController {
      guard let vc = StoryboardScene.Home.HomeViewScene.viewController() as? HomeViewController
      else {
        fatalError("ViewController 'HomeView' is not of the expected class HomeViewController.")
      }
      return vc
    }

    case LeftViewScene = "LeftView"
    static func instantiateLeftView() -> LeftMenViewController {
      guard let vc = StoryboardScene.Home.LeftViewScene.viewController() as? LeftMenViewController
      else {
        fatalError("ViewController 'LeftView' is not of the expected class LeftMenViewController.")
      }
      return vc
    }

    case RightViewScene = "RightView"
    static func instantiateRightView() -> RightViewController {
      guard let vc = StoryboardScene.Home.RightViewScene.viewController() as? RightViewController
      else {
        fatalError("ViewController 'RightView' is not of the expected class RightViewController.")
      }
      return vc
    }

    case RootViewScene = "RootView"
    static func instantiateRootView() -> RootViewController {
      guard let vc = StoryboardScene.Home.RootViewScene.viewController() as? RootViewController
      else {
        fatalError("ViewController 'RootView' is not of the expected class RootViewController.")
      }
      return vc
    }
  }
  enum InfoSecurity: String, StoryboardSceneType {
    static let storyboardName = "InfoSecurity"

    case AccountInfoSecurityVCScene = "AccountInfoSecurityVC"
    static func instantiateAccountInfoSecurityVC() -> AccountInfoSecurityVC {
      guard let vc = StoryboardScene.InfoSecurity.AccountInfoSecurityVCScene.viewController() as? AccountInfoSecurityVC
      else {
        fatalError("ViewController 'AccountInfoSecurityVC' is not of the expected class AccountInfoSecurityVC.")
      }
      return vc
    }
  }
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    case AccountManagerViewScene = "AccountManagerView"
    static func instantiateAccountManagerView() -> AccountManagerViewController {
      guard let vc = StoryboardScene.Main.AccountManagerViewScene.viewController() as? AccountManagerViewController
      else {
        fatalError("ViewController 'AccountManagerView' is not of the expected class AccountManagerViewController.")
      }
      return vc
    }

    case MainPageViewScene = "MainPageView"
    static func instantiateMainPageView() -> MainPageViewController {
      guard let vc = StoryboardScene.Main.MainPageViewScene.viewController() as? MainPageViewController
      else {
        fatalError("ViewController 'MainPageView' is not of the expected class MainPageViewController.")
      }
      return vc
    }

    case SignInViewScene = "SignInView"
    static func instantiateSignInView() -> SignInViewController {
      guard let vc = StoryboardScene.Main.SignInViewScene.viewController() as? SignInViewController
      else {
        fatalError("ViewController 'SignInView' is not of the expected class SignInViewController.")
      }
      return vc
    }
  }
  enum PK: String, StoryboardSceneType {
    static let storyboardName = "PK"

    case PKIntroduceVCScene = "PKIntroduceVC"
    static func instantiatePKIntroduceVC() -> PKIntroduceVC {
      guard let vc = StoryboardScene.PK.PKIntroduceVCScene.viewController() as? PKIntroduceVC
      else {
        fatalError("ViewController 'PKIntroduceVC' is not of the expected class PKIntroduceVC.")
      }
      return vc
    }

    case PKInvitationVCScene = "PKInvitationVC"
    static func instantiatePKInvitationVC() -> PKInvitationVC {
      guard let vc = StoryboardScene.PK.PKInvitationVCScene.viewController() as? PKInvitationVC
      else {
        fatalError("ViewController 'PKInvitationVC' is not of the expected class PKInvitationVC.")
      }
      return vc
    }

    case PKListVCScene = "PKListVC"
    static func instantiatePKListVC() -> PKListVC {
      guard let vc = StoryboardScene.PK.PKListVCScene.viewController() as? PKListVC
      else {
        fatalError("ViewController 'PKListVC' is not of the expected class PKListVC.")
      }
      return vc
    }

    case PKRulesVCScene = "PKRulesVC"
    static func instantiatePKRulesVC() -> PKRulesVC {
      guard let vc = StoryboardScene.PK.PKRulesVCScene.viewController() as? PKRulesVC
      else {
        fatalError("ViewController 'PKRulesVC' is not of the expected class PKRulesVC.")
      }
      return vc
    }

    case PKSelectOppTVCScene = "PKSelectOppTVC"
    static func instantiatePKSelectOppTVC() -> PKSelectOppTVC {
      guard let vc = StoryboardScene.PK.PKSelectOppTVCScene.viewController() as? PKSelectOppTVC
      else {
        fatalError("ViewController 'PKSelectOppTVC' is not of the expected class PKSelectOppTVC.")
      }
      return vc
    }
  }
  enum Relate: String, StoryboardSceneType {
    static let storyboardName = "Relate"

    case AboutVCScene = "AboutVC"
    static func instantiateAboutVC() -> AboutVC {
      guard let vc = StoryboardScene.Relate.AboutVCScene.viewController() as? AboutVC
      else {
        fatalError("ViewController 'AboutVC' is not of the expected class AboutVC.")
      }
      return vc
    }

    case FunctionIntroduceVCScene = "FunctionIntroduceVC"
    static func instantiateFunctionIntroduceVC() -> FunctionIntroduceVC {
      guard let vc = StoryboardScene.Relate.FunctionIntroduceVCScene.viewController() as? FunctionIntroduceVC
      else {
        fatalError("ViewController 'FunctionIntroduceVC' is not of the expected class FunctionIntroduceVC.")
      }
      return vc
    }

    case HelpAndFeedbackListVCScene = "HelpAndFeedbackListVC"
    static func instantiateHelpAndFeedbackListVC() -> HelpAndFeedbackListVC {
      guard let vc = StoryboardScene.Relate.HelpAndFeedbackListVCScene.viewController() as? HelpAndFeedbackListVC
      else {
        fatalError("ViewController 'HelpAndFeedbackListVC' is not of the expected class HelpAndFeedbackListVC.")
      }
      return vc
    }

    case HelpAndFeedbackVCScene = "HelpAndFeedbackVC"
    static func instantiateHelpAndFeedbackVC() -> HelpAndFeedbackVC {
      guard let vc = StoryboardScene.Relate.HelpAndFeedbackVCScene.viewController() as? HelpAndFeedbackVC
      else {
        fatalError("ViewController 'HelpAndFeedbackVC' is not of the expected class HelpAndFeedbackVC.")
      }
      return vc
    }

    case RelateAppVCScene = "RelateAppVC"
    static func instantiateRelateAppVC() -> RelateAppVC {
      guard let vc = StoryboardScene.Relate.RelateAppVCScene.viewController() as? RelateAppVC
      else {
        fatalError("ViewController 'RelateAppVC' is not of the expected class RelateAppVC.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}

