//
//  ViewController.swift
//  Disciplined
//
//  Created by 胡雪枫 on 2020/7/16.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit
import M13Checkbox

protocol saveExerciseProtocol: class {
    
    func saveExercise(exercise: Exercise)
    
}

class CheckViewController: UIViewController {
    
    var exerciseCollectionView: UICollectionView!
    public var exercises = [Exercise]()
    
    let exerciseReuseIdentifier = "exerciseReuseIdentifier"
    let specialReuseIdentifier = "specialReuseIdentifier"
    let paddingV: CGFloat = 8
    let paddingH: CGFloat = 16

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "TODAY"
        view.backgroundColor = .white
        
        let exerciseLayout = UICollectionViewFlowLayout()
        exerciseLayout.scrollDirection = .vertical
        exerciseLayout.minimumLineSpacing = paddingV
        exerciseLayout.minimumInteritemSpacing = paddingV
        exerciseLayout.sectionInset = UIEdgeInsets(top: 12, left: paddingH, bottom: 0.0, right: paddingH)
        
        exerciseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: exerciseLayout)
        exerciseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        exerciseCollectionView.allowsSelection = true
        exerciseCollectionView.backgroundColor = .white
        exerciseCollectionView.delegate = self
        exerciseCollectionView.dataSource = self
        exerciseCollectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: exerciseReuseIdentifier)
        exerciseCollectionView.register(SpecialCollectionViewCell.self, forCellWithReuseIdentifier: specialReuseIdentifier)
        view.addSubview(exerciseCollectionView)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            exerciseCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            exerciseCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exerciseCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            exerciseCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    

}



extension CheckViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return exercises.count 
        }
        else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: exerciseReuseIdentifier, for: indexPath) as! ExerciseCollectionViewCell
            
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 0.5
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowOpacity = 0.7
            cell.layer.shadowRadius = 2.0
            
                       
            cell.configure(exercise: exercises[indexPath.item])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: specialReuseIdentifier, for: indexPath) as! SpecialCollectionViewCell
            
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 0.2
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowOpacity = 0.7
            cell.layer.shadowRadius = 2.0
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        <#code#>
    }
    
}

extension CheckViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 2 * paddingH
        let height = (collectionView.frame.height - 3 * paddingV) / 8.0
        return CGSize(width: width, height: height)
    }
    
}

extension CheckViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let vc = AddNewViewController(delegate: self)
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let cell = collectionView.cellForItem(at: indexPath) as! ExerciseCollectionViewCell
            switch cell.checkBox.checkState {
                case .unchecked:
                    cell.checkBox.setCheckState(M13Checkbox.CheckState.checked, animated: true)
                case .checked:
                    cell.checkBox.setCheckState(M13Checkbox.CheckState.unchecked, animated: true)
                default:
                    cell.checkBox.setCheckState(M13Checkbox.CheckState.mixed, animated: true)
            }
        }

    }
    
        
}

extension CheckViewController: saveExerciseProtocol {
    
    func saveExercise(exercise: Exercise) {
        exercises.append(exercise)
        exerciseCollectionView.reloadData()
    }
    
}


