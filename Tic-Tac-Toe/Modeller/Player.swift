//
//  Player.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-01.
//

import Foundation
import UIKit

struct Player {
    var playerName: String = ""
    var aktiv : Bool = true
    var theTag : Int = 0
    var playerWin = false
    var numberOfWin = 0
    
}

struct GamePlan{
    var playSize : Int = 3
    var rate : CGFloat = 4
    var positionsCell : [Int] = []
}


struct Images {
    var xImage : UIImage? = UIImage(named: "x")
    var oImage : UIImage? = UIImage(named: "o")
    var defaultImage: UIImage? = UIImage(named: "kvadrat")
 
}
