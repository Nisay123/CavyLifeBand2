 //
//  RightViewController.swift
//  CavyLifeBand2
//
//  Created by xuemincai on 16/4/21.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import CoreBluetooth


class RightViewController: UIViewController {
    
    @IBOutlet weak var menuTabelView: UITableView!
    var menuGroup: [MenuGroupDataSource] = []
    var isConnect: Bool   = false
    
    @IBOutlet weak var bandElectricView: BandElectricView!
    
    @IBOutlet weak var fwVersion: UILabel!
    @IBOutlet weak var bandName: UILabel!
    @IBOutlet weak var bandTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        removeNotificationObserver()
        setTopViewLabel()
        
        configTableView()
        
        addMenumenuGroupData(BandFeatureMenuGroupDataModel(isConnect: false))
        addMenumenuGroupData(BandHardwareMenuGroupDataModel(isConnect: false))
        addMenumenuGroupData(BindingBandMenuGroupDataModel())
        
        NSTimer.runThisEvery(seconds: 3) { _ in
            
            self.getBandElectric()
            
        }
        
        checkBandLining()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightViewController.checkBandLining), name: BandBleNotificationName.BandConnectNotification.rawValue, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightViewController.checkBandLining), name: BandBleNotificationName.BandDesconnectNotification.rawValue, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightViewController.updateRightTop), name: NotificationName.UpdateRightTopView.rawValue, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightViewController.setEdition), name: NotificationName.IsLatestEdition.rawValue, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightViewController.removeUpdateImage), name: NotificationName.RemoveUpdateView.rawValue, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RightViewController.isUpdate), name: NotificationName.IsLatestEdition.rawValue,object: nil)
    }

    
    
    func getBandElectric() {
        
        LifeBandCtrl.shareInterface.getBandElectric { [unowned self] electric in
            
            self.bandElectricView.setElectric(CGFloat(electric), isConnect: true)
            self.fwVersion.text = L10n.BandFWVersion.string + "\(BindBandCtrl.hwVersion)" + "." + "\(BindBandCtrl.fwVersion)"
            
        }
        
    }
    
    func updateRightTop() {
        
        LifeBandCtrl.shareInterface.getBandElectric { [unowned self] electric in
            
            self.bandElectricView.setElectric(CGFloat(electric), isConnect: true)
            self.fwVersion.text = L10n.BandFWVersion.string + "\(BindBandCtrl.hwVersion)" + "." + "\(BindBandCtrl.fwVersion)"
            
        }
        
    }
    
    //显示固件部分图片
    func setEdition(userInfo: NSNotification) {
        
        let newIndexpath = (NSIndexPath (forRow: 0, inSection: 1))
        
        
        let cell =  menuTabelView.cellForRowAtIndexPath(newIndexpath) as? MenuTableViewCell
        
        if cell != nil {
           cell?.updateImage.hidden = false
            
        }
        

        
    }
    
    
     //隐藏固件部分图片
    func removeUpdateImage() {
        
//        let newIndexpath = (NSIndexPath (forRow: 0, inSection: 1))
//        menuTabelView.reloadRowsAtIndexPaths([newIndexpath], withRowAnimation: .None)
        
        let newIndexpath = (NSIndexPath (forRow: 0, inSection: 1))
        
        
        let cell =  menuTabelView.cellForRowAtIndexPath(newIndexpath) as? MenuTableViewCell
        
        if cell != nil {
            cell?.updateImage.hidden = true
            
        }


    }
    
    
    //固件升级显示样式，
    func  isUpdate (userInfo: NSNotification){
        
        let isUpdate = (userInfo.userInfo?["isLatest"] ?? false) as! Bool
        
//        let isUpdate = userInfo.userInfo?["isLasted"] as!BOOl 
        
        
        if  isUpdate == true { //是最新版本
            let newIndexpath = (NSIndexPath (forRow: 0, inSection: 1))
            
            
            let cell =  menuTabelView.cellForRowAtIndexPath(newIndexpath) as? MenuTableViewCell
            
            if cell != nil {
                cell?.updateImage.hidden = true
                
            }

            
        }else {
            
            let newIndexpath = (NSIndexPath (forRow: 0, inSection: 1))
            
            
            let cell =  menuTabelView.cellForRowAtIndexPath(newIndexpath) as? MenuTableViewCell
            
            if cell != nil {
                cell?.updateImage.hidden = false
                
            }
            
        }
        
        
    }
    
    deinit {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: BandBleNotificationName.BandConnectNotification.rawValue, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: BandBleNotificationName.BandDesconnectNotification.rawValue, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NotificationName.UpdateRightTopView.rawValue, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NotificationName.IsLatestEdition.rawValue, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NotificationName.RemoveUpdateView.rawValue, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NotificationName.IsLatestEdition.rawValue, object: nil)
        
    }
    
    func setTopViewLabel() {
        bandTitle.textColor = UIColor(named: .EColor)
        fwVersion.textColor = UIColor(named: .FColor)
        bandName.textColor  = UIColor(named: .FColor)
        
        bandTitle.font = UIFont.systemFontOfSize(18.0)
        fwVersion.font = UIFont.systemFontOfSize(12.0)
        bandName.font  = UIFont.systemFontOfSize(12.0)
    }
    
    /**
     检查连接状态
     
     - author: sim cai
     - date: 2016-05-30
     */
    func checkBandLining() {
        
        if LifeBandBle.shareInterface.getConnectState() != .Connected {
            
            bandTitle.text = L10n.BandDisconnectTitle.string
            fwVersion.text = L10n.BandDisconnectFWVersionTitle.string
            bandName.text  = L10n.BandDisconnectBandNameTitle.string
            self.bandElectricView.setElectric(nil, isConnect: false)
            
            isConnect  = false
            clearMenuMenuGroupData()
            addMenumenuGroupData(BandFeatureMenuGroupDataModel(isConnect: false))
            addMenumenuGroupData(BandHardwareMenuGroupDataModel(isConnect: false))
            addMenumenuGroupData(BindingBandMenuGroupDataModel())
            menuTabelView.reloadData()
            
        } else {
            
            bandTitle.text = L10n.BandTitle.string
            fwVersion.text = L10n.BandFWVersion.string + L10n.BandDisconnectGetFWVersionTitle.string
            bandName.text  = LifeBandBle.shareInterface.getPeripheralName()
//            getBandElectric()
            
            isConnect  = true
            clearMenuMenuGroupData()
            addMenumenuGroupData(BandFeatureMenuGroupDataModel(isConnect: true))
            addMenumenuGroupData(BandHardwareMenuGroupDataModel(isConnect: true))
            addMenumenuGroupData(BindingBandMenuGroupDataModel())
            menuTabelView.reloadData()
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     添加菜单组数据
     
     - parameter menuGroup:
     */
    func addMenumenuGroupData(menuGroup: MenuGroupDataSource) {
        self.menuGroup.append(menuGroup)
    }
    
    /**
     连接状态改变的时候重新添加数据来显示
     */
    func  clearMenuMenuGroupData() {
        
        self.menuGroup.removeAll()
    }
    
    func configTableView() {
        
        menuTabelView.registerNib(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        menuTabelView.backgroundColor = UIColor(named: .HomeViewMainColor)
        
    }
    
    
    
}

// MARK: - tableview 扩展
extension RightViewController {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell", forIndexPath: indexPath)
        
        guard let menuCell = cell as? MenuTableViewCell else {
            return cell
        }
        
        if !isConnect && indexPath.row < 4 {
            cell.selectionStyle = .None
        }
        
        let cellViewModel = menuGroup[indexPath.section].items[indexPath.row]
        menuCell.configure(cellViewModel, delegate: cellViewModel)
        
        
        
        return menuCell
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menuGroup.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuGroup[section].rowCount
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return menuGroup[section].sectionHeight
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return menuGroup[section].sectionView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if isConnect {
            
            menuGroup[indexPath.section].items[indexPath.row].onClickCell()
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
        }else
        
        {
            if indexPath.section == 2 {
                menuGroup[indexPath.section].items[indexPath.row].onClickCell()
                tableView.deselectRowAtIndexPath(indexPath, animated: false)
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return menuGroup[indexPath.section].items[indexPath.row].cellHeight
    }
    
    
}
 