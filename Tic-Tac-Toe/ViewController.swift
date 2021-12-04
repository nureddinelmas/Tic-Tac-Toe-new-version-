//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player2NameLabel: UITextField!
    @IBOutlet weak var player1NameLabel: UITextField!
    var p = PlayerActions()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    @IBAction func playNow(_ sender: UIButton) {
        performSegue(withIdentifier: "toPlayPlan", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlayPlan" {
            let destinationVC = segue.destination as! TicTacToeViewController
            
            if let p1 = player1NameLabel.text, let p2 = player2NameLabel.text {
                destinationVC.player1.playerName = p1.uppercased()
                destinationVC.player2.playerName = p2.uppercased()
            }
          
        }

    }
    
}

