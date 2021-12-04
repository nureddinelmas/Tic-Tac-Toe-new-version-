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
 
    
}

struct GamePlan{
    var playSize : Int = 3
    var rate : CGFloat = 4
    var positionsCell : [Int] = []
}


struct Images {
    var xImage : UIImage
    var oImage : UIImage
    var defaultImage: UIImage
 
}
