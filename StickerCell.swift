//
//  StickerCell.swift
//  ExcitedCowSticker
//
//  Created by SUmmer on 2020/7/1.
//  Copyright © 2020 Summer. All rights reserved.
//

import UIKit

class StickerCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configContentView(iconString:NSString,titleString:NSString) {
        let iconImg = UIImageView()
        let titleLabel = UILabel()
        
        iconImg.image = UIImage(named: iconString as String)
        iconImg.contentMode = .scaleAspectFill
        iconImg.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        self.contentView.addSubview(iconImg)
        
        self.contentView.addSubview(titleLabel)
        
        
        
    }
    

}
