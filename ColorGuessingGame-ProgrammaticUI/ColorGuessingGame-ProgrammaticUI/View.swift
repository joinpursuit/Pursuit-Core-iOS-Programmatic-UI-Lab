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
    
    public lazy var messageLabel2: UILabel = {
        let label2 = UILabel()
        label2.backgroundColor = .systemGray
        label2.textAlignment = .center
        label2.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label2.text = defaultMessage2
        return label2
    }()
    
}
