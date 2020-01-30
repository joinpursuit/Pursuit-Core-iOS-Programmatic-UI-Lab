//
//  View.swift
//  ColorGuessingGame-ProgrammaticUI
//
//  Created by Yuliia Engman on 1/29/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class View: UIView {

let defaultMessage = "COLOR GUESSING GAME"

let defaultMessage2 = "Pick button with color that containts the most of it on screen above."
    
    // create a label
    // LAZY VAR - creates after my main instance will be created
    // it will not get called until the instances will be creating
    
    public lazy var messageLabel: UILabel = {
        let label = UILabel()// initializing a label
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = defaultMessage
        return label
    }()
    
    public lazy var imageView: UIImageView = {
        let displayedColor = UIImageView()
        displayedColor.backgroundColor = .systemRed
        return displayedColor
    }()
    
    public lazy var buttonRed: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .systemRed
        return button1
    }()
    
    public lazy var buttonBlue: UIButton = {
           let button2 = UIButton()
           button2.backgroundColor = .systemBlue
           return button2
       }()
    
    public lazy var buttonGreen: UIButton = {
           let button3 = UIButton()
           button3.backgroundColor = .systemGreen
           return button3
       }()
    
    public lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray3
        return stackView
    }()
    
    public lazy var messageLabel2: UILabel = {
        let label2 = UILabel()
        label2.backgroundColor = .systemBackground
        label2.textAlignment = .center
        label2.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label2.text = defaultMessage2
        label2.numberOfLines = 0
        return label2
    }()
    
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("Play again!", for: .normal)
        return button
    }()
    
    // init(frame: ) gets called if view is done programmatically
      override init(frame: CGRect) {
          super.init(frame: UIScreen.main.bounds)
          commonInit()
      }

      // if this view get initialized from storyboard
      // this initializer gets called
      // with coder will be called if we have visual Main.Storyboard
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          commonInit()
      }
    
    // gets called if we used code to create a storyboard
    private func commonInit() {
        setupMessageLabelConstraints()
        setupImageViewConstraints() // does not constraints properly, REMEMBER WHEN SET TRAILING CONSTRAINTS USE - (minus)
        setupStackViewConstraints()
        setupMessage2LabelConstraints()
        setupResetButtonConstraints()
    }
    
    private func setupMessageLabelConstraints() {
        // add the message label to the MainView
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func setupImageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupStackViewConstraints() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(buttonRed)
        horizontalStackView.addArrangedSubview(buttonBlue)
        horizontalStackView.addArrangedSubview(buttonGreen)
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonRed.translatesAutoresizingMaskIntoConstraints = false
        buttonBlue.translatesAutoresizingMaskIntoConstraints = false
        buttonGreen.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            horizontalStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            //horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
        
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 50.0
        
    }
    
    private func setupMessage2LabelConstraints() {
          // add the message label to the MainView
          addSubview(messageLabel2)
          messageLabel2.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
            messageLabel2.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 40),
            messageLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //messageLabel2.heightAnchor.constraint(equalTo: heightAnchor, constant: 30)
          ])
      }
    
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.centerYAnchor.constraint(equalTo: messageLabel2.bottomAnchor, constant: 40)
        ])
    }
}
