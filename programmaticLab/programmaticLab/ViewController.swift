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
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: \(score)"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = guessColor.getNewColor()
        return view
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset Game", for: .normal)
        button.addTarget(self, action: #selector(reset(_:)), for: .touchUpInside)
        button.isHidden = true
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let guessColor = ColorGuessingModel()
    
    private var score = 0 {
        didSet {
            labelChange()
        }
    }
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    // MARK: Private Methods
    
    @objc private func buttonPressed(_ sender: UIButton) {
        if guessColor.isDominant(guess: sender.backgroundColor ?? .black) {
            colorView.backgroundColor = guessColor.getNewColor()
            score += 1
        } else {
            resetButton.isHidden = false
            [redButton, greenButton, blueButton].forEach { $0.isEnabled = false }
            scoreLabel.text = "You Lost!"
        }
    }
    
    @objc private func reset(_ sender: UIButton) {
        score = 0
        colorView.backgroundColor = guessColor.getNewColor()
        [redButton, greenButton, blueButton].forEach { $0.isEnabled = true }
        sender.isHidden = true
    }
    
    private func labelChange() {
        scoreLabel.text = "Score: \(score)"
    }
    
    private func configureView() {
        view.backgroundColor = .systemOrange
        setupColorView()
        setupButtons()
        setupLabel()
        setupResetButton()
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
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)])
    }
    
    private func setupLabel() {
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    private func setupResetButton() {
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.widthAnchor.constraint(equalToConstant: view.frame.width / 4)])
    }
    
    
    
}

