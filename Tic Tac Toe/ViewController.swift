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
                        alert1.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        present(alert1, animated: true)
                        
                    }
                    else
                    {
                        alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        present(alert2, animated: true)

                    }
                
                    playAgainButton.isHidden = false
                    
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
            alert3.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert3, animated: true)
            playAgainButton.isHidden = false
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        activeGame = true
        activeplayer = 1
        playAgainButton.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBgColor(colorOne: UIColor.green, colorTwo: UIColor.green, colorThree: UIColor.yellow, colorFour: UIColor.yellow)
    
        // Do any additional setup after loading the view, typically from a nib.
    }


}


