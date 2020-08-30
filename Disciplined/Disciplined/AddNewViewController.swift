//
//  AddNewViewController.swift
//  Disciplined
//
//  Created by 胡雪枫 on 2020/7/20.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController {
    
    weak var delegate: saveExerciseProtocol?

    var exerciseTextField: UITextField!
    var exerciseTextLabel: UILabel!
    
    init(delegate: saveExerciseProtocol?) {
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新的运动"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveText))

        // Do any additional setup after loading the view.
        exerciseTextLabel = UILabel()
        exerciseTextLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseTextLabel.text = "运动名称: "
        exerciseTextLabel.textColor = .black
        exerciseTextLabel.font = .boldSystemFont(ofSize: 15)
        view.addSubview(exerciseTextLabel)
        
        exerciseTextField = UITextField()
        exerciseTextField.translatesAutoresizingMaskIntoConstraints = false
        exerciseTextField.placeholder = "输入想要添加的运动"
        exerciseTextField.borderStyle = .roundedRect
        exerciseTextField.backgroundColor = .white
        exerciseTextField.textAlignment = .center
        exerciseTextField.clearsOnBeginEditing = true
        view.addSubview(exerciseTextField)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            exerciseTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            exerciseTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            exerciseTextField.topAnchor.constraint(equalTo: exerciseTextLabel.topAnchor),
            exerciseTextField.leadingAnchor.constraint(equalTo: exerciseTextLabel.trailingAnchor, constant: 10),
            exerciseTextField.centerYAnchor.constraint(equalTo: exerciseTextLabel.centerYAnchor),
            exerciseTextField.widthAnchor.constraint(equalToConstant: 200),
            exerciseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    @objc func saveText() {
        if let exerciseName = exerciseTextField.text {
            if exerciseName == "" {
                let alert = UIAlertController(title: "Alert", message: "Create a New Exercise and Save It", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let exercise1 = Exercise(exerciseName: exerciseName)
                delegate?.saveExercise(exercise: exercise1)
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
