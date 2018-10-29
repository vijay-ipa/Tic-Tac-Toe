//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jai Bhim on 10/28/18.
//  Copyright © 2018 Bhimanapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 1 is Cross and 2 is Nought
    var activeplayer = 1
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
    
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0
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
                    
                }
                
            }
            
        }
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBgColor(colorOne: UIColor.green, colorTwo: UIColor.green, colorThree: UIColor.yellow, colorFour: UIColor.yellow)
    
        // Do any additional setup after loading the view, typically from a nib.
    }


}


