//
//  ViewController.swift
//  TicTacToeWithHaz
//
//  Created by Sean Jones on 4/8/20.
//  Copyright © 2020 Sean Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionButton(_ sender: Any) {

        if gameState[(sender as AnyObject).tag - 1] == 0 {
            gameState[(sender as AnyObject).tag - 1] = activePlayer
        if activePlayer == 1 {
            (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControl.State())
            activePlayer = 2
        } else
        {
           (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControl.State())
            activePlayer = 1
        }
        
        
    }
    }
    
}

