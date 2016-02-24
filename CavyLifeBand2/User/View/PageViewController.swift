//
//  PageViewController.swift
//  Pods
//
//  Created by xuemincai on 16/2/24.
//
//

import UIKit
import EZSwiftExtensions
import SnapKit

class PageViewController: UIViewController {

    // 注册按钮
    @IBOutlet weak var signInBtn: UIButton!
    
    // 登入按钮
    @IBOutlet weak var signUpBtn: UIButton!
    
    // 存放注册、登录按钮的视图
    @IBOutlet weak var buttonView: UIView!
    
    // 是否是最后一个视图
    var isLastPage = false
    
    // 背景图片UIImageView
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // 页面控制器
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    // 背景图片
    var backgroundImage: UIImage!
    
    // 1/25 宽度间隙
    let spacing25 = ez.screenWidth / 25
    
    // 当前视图索引
    var pageIndex = 0
    
    // 布局常量定义
    
    // 按钮大小
    var buttonSize: CGSize {
        
        get {
            return CGSize(width: (spacing25 * 10), height: (spacing25 * 3))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = backgroundImage
        
        defineLayoutSubViews()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     定义子视图布局
     */
    func defineLayoutSubViews() {
        
        if isLastPage {
            
            viewLayout()
            buttonLayout()
            
        }
        
        
        pageCtrl.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(backgroundImageView).offset(-((buttonSize.height * 3) - (pageCtrl.size.height / 2)))
        }
        
    }
    
    /**
     视图布局
     */
    func viewLayout() {
        
        buttonView.hidden = false
        buttonView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(backgroundImageView).offset(spacing25 * 2)
            make.right.equalTo(backgroundImageView).offset(-(spacing25 * 2))
            make.height.equalTo(buttonSize.height)
            make.bottom.equalTo(backgroundImageView).offset(-buttonSize.height)
        }
    }
    
    /**
     按钮布局
     */
    func buttonLayout() {
        
        signInBtn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(buttonSize.width)
        }
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
