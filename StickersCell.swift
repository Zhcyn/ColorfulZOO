//
//  StickersCell.swift
//  ExcitedCowSticker
//
//  Created by summer on 2020/7/1.
//  Copyright © 2020 Summer. All rights reserved.
//

import UIKit

class StickersCell: UICollectionViewCell {
    func configView(titleString: NSString?) {
        iconImageView.image = UIImage(named: titleString! as String)
    }
    
    private lazy var iconImageView: UIImageView = {
        var iconImageView = UIImageView()
        return iconImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func initViews() {
        self.contentView.backgroundColor = .white
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.frame =  CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        self.contentView.addSubview(iconImageView)
        
    }
}
