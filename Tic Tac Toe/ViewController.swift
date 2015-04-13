//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Francisco de la Pena on 2/18/15.
//  Copyright (c) 2015 ___QuixoteLabs___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var winner = false
    
    var player_1 = [Int]()
    
    var player_2 = [Int]()
    
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var allButtons: [UIButton]!
    
    var gameCounter = 0
    
    @IBAction func resetPressed(sender: UIButton) {
        
        for var i = 0; i < allButtons.count; i++ {
            
            allButtons[i].setImage(UIImage(named: "blank"), forState: UIControlState.Normal)
        }
        
        gameCounter = 0
        
        winner = false
        
        println("GameCounter: \(gameCounter)")
        
        player_1 = [Int]()
        
        player_2 = [Int]()
        
    }
    
    @IBAction func cellTapped(sender: UIButton) {
    
        if (find(player_1, sender.tag) == nil) && (find(player_2, sender.tag) == nil) {
            if (gameCounter%2) == 0 {

                sender.setImage(UIImage(named: "O"), forState: UIControlState.Normal)
            
                player_1.append(sender.tag)
            
                checkWinner(player_1)
        
            } else {
                println("Player 2 (X)")
                sender.setImage(UIImage(named: "X"), forState: UIControlState.Normal)
            
                player_2.append(sender.tag)

                checkWinner(player_2)
            }
        
            if winner {
            
                showMessage()
            
                resetPressed(resetButton)
            
            } else {
            
                gameCounter++
        
            }
        }
        
    }
    
    
    func checkWinner(player: [Int]) -> Void {
        
        if (player.count >= 3) {
            
            if find(player, 0) != nil {
                
                if find(player, 1) != nil {
                    
                    if find(player, 2) != nil {
                        
                        winner = true
        
                    }
                
                } else if find(player, 3) != nil {
                    
                    if find(player, 6) != nil {
                        
                        winner = true
                        
                    }
                    
                } else if find(player, 4) != nil {
                    
                    if find(player, 8) != nil {
                        
                        winner = true
                        
                    }
                    
                }
                
            } else if find(player, 1) != nil {
                
                if find(player, 4) != nil {
                    
                    if find(player, 7) != nil {
                        
                        winner = true
                        
                    }
                    
                }
                
            } else if find(player, 2) != nil {
                
                if find(player, 4) != nil {
                    
                    if find(player, 6) != nil {
                        
                        winner = true
                        
                    }
                    
                } else if find(player, 5) != nil {
                    
                    if find(player, 8) != nil {
                        
                        winner = true
                        
                    }
                    
                }
            
            } else if find(player, 3) != nil {
                
                if find(player, 4) != nil {
                    
                    if find(player, 5) != nil {
                        
                        winner = true
                        
                    }
                    
                }
            
            } else if find(player, 6) != nil {
                
                if find(player, 7) != nil {
                    
                    if find(player, 8) != nil {
                        
                        winner = true
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func showMessage() -> Void {
        let alertController = UIAlertController(title: "Congratulations", message: "You WIN!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

