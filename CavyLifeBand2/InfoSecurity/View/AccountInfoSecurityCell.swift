//
//  AccountInfoSecurityCell.swift
//  CavyLifeBand2
//
//  Created by Jessica on 16/3/30.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import Log


enum SwitchTag: Int {
    
    case HeightSwitchTag = 3000
    case WeightSwitchTag = 3001
    case BirthSwitchTag = 300
}

class AccountInfoSecurityCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var infoSwitch: UISwitch!

    private var dataSource: AccountInfoSecurityListDataSource?
    
    
    @IBAction func switchAction(sender: AnyObject) {
        
        dataSource?.changeSwitchStatus(sender as! UISwitch)
        
        Log.info("\(titleLabel.text) --- \(sender.on)")
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor(named: .ContactsTitleColor)
        
    }
    
    func configure(dataSource: [AccountInfoSecurityCellViewModel]) {
        
        self.dataSource = dataSource[0]
        
        infoSwitch.on = dataSource[0].isOpen
        
        titleLabel.text = dataSource[0].title
        
        dataSource[0].changeSwitchStatus(infoSwitch)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

protocol AccountInfoSecurityListDataSource {
    
    var title: String { get}
    
    var isOpen: Bool { get }
    
    func changeSwitchStatus(sender: UISwitch)
    
}



