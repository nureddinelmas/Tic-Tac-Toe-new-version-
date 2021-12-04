//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-01.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    
    @IBOutlet weak var playSizePickerView: UIPickerView!
    
    @IBOutlet weak var player2NameLabel: UITextField!
    @IBOutlet weak var player1NameLabel: UITextField!
    
    private var playSizeValues = ["3 x 3", "4 x 4", "5 x 5", "6 x 6", "9 x 9", "10 x 10"]
    var selectedSize : Int = 3
   
    override func viewDidLoad() {
        super.viewDidLoad()

        playSizePickerView.delegate = self
        playSizePickerView.dataSource = self
        playSizePickerView.selectRow(playSizeValues.count/3, inComponent: 0, animated: true)
        pickerView(playSizePickerView, didSelectRow: playSizeValues.count/3, inComponent: 0)
        
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playSizeValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(playSizeValues[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch playSizeValues[row]{
        case "3 x 3" : selectedSize = 3
        case "4 x 4" : selectedSize = 4
        case "5 x 5" : selectedSize = 5
        case "6 x 6" : selectedSize = 6
        case "9 x 9" : selectedSize = 9
        case "10 x 10" : selectedSize = 10
        default: selectedSize = 3
            
        }
        
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
                destinationVC.gamePlan.playSize = selectedSize
              
            }
          
        }

    }
    
}

