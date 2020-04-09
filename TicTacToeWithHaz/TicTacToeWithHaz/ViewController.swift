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
    
    let winningCombo = [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    // MARK: - Outlets
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winnersLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
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
        for combo in winningCombo {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                gameIsActive = false
                
                if gameState[combo[0]] == 1 {
                    
                    winnersLabel.text = "Cross has won!"
                } else {
                    winnersLabel.text = "Nought has won!"
                }
                
                playAgainButton.isHidden = false
                winnersLabel.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            winnersLabel.text = "Wow a Draw!"
            winnersLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        winnersLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
}// End of Class

