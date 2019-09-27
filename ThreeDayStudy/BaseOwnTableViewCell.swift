

//
//  BaseOwnTableViewCell.swift
//  ThreeDayStudy
//
//  Created by le tong on 2019/9/27.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseOwnTableViewCell: UITableViewCell {

    var nameLabel = UILabel()
    var iconImageView = UIImageView()
    var contentLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        iconImageView = UIImageView.init(frame: CGRect(x: 20, y: 0, width: 100, height: 100))
        nameLabel = UILabel.init(frame: CGRect(x: 140, y: 20, width: 100, height: 20))
        contentLabel = UILabel.init(frame: CGRect(x: 140, y: 50, width: 200, height: 20))
        contentView.addSubview(nameLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(contentLabel)
    }
    func updateCurrentUI(model:BaseModel) -> Void {
        iconImageView.image = UIImage.init(named: model.iconImage)
        nameLabel.text = model.name
        contentLabel.text = model.content
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
