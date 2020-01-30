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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
       // view.resetButton.addTarget(self, action: #selector(resetAppCollor(_:)), for: .touchUpInside)
    }



}

