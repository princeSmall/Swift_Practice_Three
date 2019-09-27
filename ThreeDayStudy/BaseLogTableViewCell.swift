//
//  BaseLogTableViewCell.swift
//  ThreeDayStudy
//
//  Created by le tong on 2019/9/27.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseLogTableViewCell: UITableViewCell {

    var nameLabel = UILabel()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel = UILabel.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2.0 - 100, y: 20, width: 200, height: 20))
        nameLabel.textColor = UIColor.red
        nameLabel.text = "Log Out"
        nameLabel.textAlignment = NSTextAlignment.center
        contentView.addSubview(nameLabel)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
