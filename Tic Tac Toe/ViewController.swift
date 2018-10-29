//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jai Bhim on 10/28/18.
//  Copyright © 2018 Bhimanapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeGame = true
    
    // 1 is Cross and 2 is Nought
    var activeplayer = 1
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame
        {
            gameState[activePosition] = activeplayer
            
            if (activeplayer == 1)
            {
                sender.setImage(UIImage(named: "Cross-01.png"), for: UIControl.State())
                activeplayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activeplayer = 1
            }
            
            for combination in winningcombinations
            {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    activeGame = false
                    
                    if gameState[combination[0]] == 1
                    {
                        let alert1 = UIAlertController(title: "Kudos......!", message: "Player X has Won", preferredStyle: .alert)
                        alert1.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in
                            self.playAgain(sender)
                        }))

                        present(alert1, animated: true)
                        
                    }
                    else
                    {
                        let alert2 = UIAlertController(title: "Kudos......!", message: "Player O has Won", preferredStyle: .alert)
                        alert2.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in
                            self.playAgain(sender)
                        }))
                        present(alert2, animated: true)
                        
                    }
                    
                }
                
            }
            
        }
        activeGame = false
        for i in gameState
        {
            if i == 0
            {
                activeGame = true
                break
            }
        }
        if activeGame == false
        {
            let alert3 = UIAlertController(title: "It's a Draw.....!", message: "There is no Winner", preferredStyle: .alert)
            alert3.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in
                self.playAgain(sender)
            }))

            present(alert3, animated: true)

        }
    }
    
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        activeGame = true
        activeplayer = 1
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())

        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBgColor(colorOne: UIColor.green, colorTwo: UIColor.green, colorThree: UIColor.yellow, colorFour: UIColor.yellow)
    
    }


}


