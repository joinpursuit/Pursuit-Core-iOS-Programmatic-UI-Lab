//
//  ViewController.swift
//  programmaticLab
//
//  Created by Ahad Islam on 2/4/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    private lazy var greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()
    
    private lazy var blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = guessColor.getNewColor()
        return view
    }()
    
    var guessColor = ColorGuessingModel()
    
    // MARK: Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    // MARK: Private Methods
    
    private func configureView() {
        view.backgroundColor = .systemOrange
        setupColorView()
        setupButtons()
    }
    
    private func setupColorView() {
        view.addSubview(colorView)
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            colorView.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    private func setupButtons() {
        
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)])
        
        
    }


}

