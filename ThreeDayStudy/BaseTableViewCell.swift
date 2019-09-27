
//
//  BaseTableViewCell.swift
//  ThreeDayStudy
//
//  Created by le tong on 2019/9/27.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    var iconImageView = UIImageView()
    var nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        self.setCurrentUI()
    }
    
    func updateCurrentUI(model:models) -> Void {
        iconImageView.image = UIImage.init(named: model.icon)
        nameLabel.text = model.name
        nameLabel.textColor = UIColor.black
    }
    
    func updateCurrentUIWithNoIcon(name: String) -> Void {
        nameLabel.text = name
        nameLabel.textColor = UIColor.blue
    }
    
    func setCurrentUI() -> Void {
        iconImageView = UIImageView.init(frame: CGRect(x: 20, y: 10, width: 40, height: 40))
        nameLabel = UILabel.init(frame: CGRect(x: 80, y: 20, width: 200, height: 20))
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
