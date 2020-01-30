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
        label.backgroundColor = .systemGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.text = defaultMessage
        return label
    }()
    
    public lazy var imageView: UIImageView = {
        let displayedColor = UIImageView()
        displayedColor.backgroundColor = .systemRed
        return displayedColor
    }()
    
    public lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemPink
        return stackView
    }()
    
    public lazy var messageLabel2: UILabel = {
        let label2 = UILabel()
        label2.backgroundColor = .systemGray
        label2.textAlignment = .center
        label2.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label2.text = defaultMessage2
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
//        setupMessageLabelConstraints()
//        setupResetButtonConstraints()
    }
    
    private func setupMessageLabelConstraints() {
        // add the message label to the MainView
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)
        ])
    }
    
    private func setupImageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)
           // I assume we need to set height and width
        ])
    }
    
    private func setupStackViewConstraints() {
        
    }
    
    private func setupMessage2LabelConstraints() {
          // add the message label to the MainView
          addSubview(messageLabel2)
          messageLabel.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
            messageLabel2.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 40),
              messageLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
              messageLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)
          ])
      }
    
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.centerYAnchor.constraint(equalTo: messageLabel2.bottomAnchor, constant: 20)
        ])
    }
    
}
