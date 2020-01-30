//
//  ViewController.swift
//  ColorGuessingGame-ProgrammaticUI
//
//  Created by Yuliia Engman on 1/28/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myView = View()
    
    // if doing programmatic layout implement and setup the view in loadView()
    // loadView() sets up the initial view of the controller
    // do not call super when using overriding loadView()
    
    override func loadView() {
        view = myView
    }
    
    var score = 0
    var totalScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        myView.buttonRed.addTarget(self, action: #selector(colorButtons (_:)), for: .touchUpInside)
        
        myView.buttonBlue.addTarget(self, action: #selector(colorButtons (_:)), for: .touchUpInside)
        
        myView.buttonGreen.addTarget(self, action: #selector(colorButtons (_:)), for: .touchUpInside)
        
        myView.resetButton.addTarget(self, action: #selector(playAgain(_:)), for: .touchUpInside)
    }

    @objc
    private func colorButtons (_ sender: UIButton) {
    
        let colorArray = [myView.redValue, myView.greenValue, myView.blueValue]
        switch sender.tag {
            case 0:
                if colorArray.max() == myView.redValue {
                    score += 1
                    totalScore += 1
                    myView.messageLabel2.text = "You guessed correctly! Your current score is \(score). Total score of the game is \(totalScore). Keep playing."
                    myView.redValue = CGFloat.random(in: 0...1)
                    myView.greenValue = CGFloat.random(in: 0...1)
                    myView.blueValue = CGFloat.random(in: 0...1)
        
                    self.myView.imageView.backgroundColor = UIColor(red: myView.redValue, green: myView.greenValue, blue: myView.blueValue, alpha: CGFloat.random(in: 0...1))
                } else {
                    myView.messageLabel2.text = "Wrong guess. Your total score of the game is \(totalScore). Game over!"
                    myView.buttonRed.isEnabled = false
                    myView.buttonBlue.isEnabled = false
                    myView.buttonGreen.isEnabled = false
                }
            case 1:
                if colorArray.max() == myView.greenValue {
                    score += 1
                    totalScore += 1
                    myView.messageLabel2.text = "You guessed correctly! Your current score is \(score). Total score of the game is \(totalScore). Keep playing."
                    myView.redValue = CGFloat.random(in: 0...1)
                    myView.greenValue = CGFloat.random(in: 0...1)
                    myView.blueValue = CGFloat.random(in: 0...1)
                    myView.imageView.backgroundColor = UIColor(red: myView.redValue, green: myView.greenValue, blue: myView.blueValue, alpha: CGFloat.random(in: 0...1))
                } else {
                    myView.messageLabel2.text = "Wrong guess. Your total score of the game is \(totalScore). Game over!"
                    myView.buttonRed.isEnabled = false
                    myView.buttonBlue.isEnabled = false
                    myView.buttonGreen.isEnabled = false
                }
            case 2:
                if colorArray.max() == myView.blueValue {
                    score += 1
                    totalScore += 1
                    myView.messageLabel2.text = "You guessed correctly! Your current score is \(score). Total score of the game is \(totalScore). Keep playing."
                    myView.redValue = CGFloat.random(in: 0...1)
                    myView.greenValue = CGFloat.random(in: 0...1)
                    myView.blueValue = CGFloat.random(in: 0...1)
                    myView.imageView.backgroundColor = UIColor(red: myView.redValue, green: myView.greenValue, blue: myView.blueValue, alpha: CGFloat.random(in: 0...1))
                } else {
                    myView.messageLabel2.text = "Wrong guess. Your total score of the game is \(totalScore). Game over!"
                    myView.buttonRed.isEnabled = false
                    myView.buttonBlue.isEnabled = false
                    myView.buttonGreen.isEnabled = false
                } default:
                    myView.messageLabel2.text = "error"
            }
        }
    
    
    @objc
    private func playAgain(_ sender: UIButton) {
          score = 0
        myView.buttonRed.isEnabled = true
        myView.buttonBlue.isEnabled = true
        myView.buttonGreen.isEnabled = true
          viewDidLoad()
      }
    
    }
