//
//  PlayerActions.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-03.
//

import Foundation
import UIKit

class PlayerActions {
    var player1 = Player()
    var player2 = Player()
    
    var gamePlan = GamePlan()
    
    func checkItNumber1(cVW : UICollectionView) {
        var resultP1 = true
        var resultP2 = true
        
        for column in 0...Int(gamePlan.playSize-1){
            for row in 0...Int(gamePlan.playSize-1) {
                print(IndexPath.init(row: row, section: column))
                let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: column)) as! TicTacToeCollectionViewCell
                if cell.theTag != player1.theTag{
                    print(IndexPath.init(row: row, section: column))
                    resultP1 = false
                }
                if cell.theTag != player2.theTag{
                    resultP2 = false
                }
            }
            if resultP1{
                player1.didHeWin = true
                print("player 1 won")
                return
            }else if resultP2{
                player2.didHeWin = true
                print("player 2 won")
                return
            }else{
                resultP1 = true
                resultP2 = true
            }
        }
        
        }
}
