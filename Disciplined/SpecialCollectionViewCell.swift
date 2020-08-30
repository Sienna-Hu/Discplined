//
//  SpecialCollectionViewCell.swift
//  Disciplined
//
//  Created by 胡雪枫 on 2020/7/18.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class SpecialCollectionViewCell: UICollectionViewCell {
    
    var addLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addLabel = UILabel()
        addLabel.text = "+ Add a New Exercise"
        addLabel.backgroundColor = .white
        addLabel.textAlignment = .center
        addLabel.textColor = .darkGray
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            addLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            addLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            addLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            addLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
        
    }
    
}
