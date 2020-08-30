//
//  ExerciseCollectionViewCell.swift
//  Disciplined
//
//  Created by 胡雪枫 on 2020/7/16.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit
import M13Checkbox

class ExerciseCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var checkBox: M13Checkbox!
    
    let padding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.backgroundColor = .white
        contentView.addSubview(nameLabel)
        
        checkBox = M13Checkbox()
        checkBox.tintColor = UIColor.gray
        checkBox.stateChangeAnimation = M13Checkbox.Animation.expand(M13Checkbox.AnimationStyle.stroke)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkBox)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant:  20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.heightAnchor.constraint(equalToConstant: 30),
            checkBox.widthAnchor.constraint(equalToConstant: 30),
            checkBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
    }
    
    func configure(exercise: Exercise) {
        nameLabel.text = exercise.exerciseName
        imageView.image = UIImage(named: "emoji")
    }
}
