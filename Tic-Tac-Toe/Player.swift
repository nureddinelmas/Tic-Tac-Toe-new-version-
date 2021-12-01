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
    var positions : [IndexPath] = []
    var theTag = 1
    
}

struct GamePlan{
    var row : Int = 3
    var rate : CGFloat = 4
}


struct Images {
    var xImage : UIImage
    var oImage : UIImage
    var defaultImage: UIImage
 
}
