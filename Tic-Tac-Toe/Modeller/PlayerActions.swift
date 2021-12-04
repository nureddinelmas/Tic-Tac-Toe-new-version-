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

    func checkItNumber(cVW : UICollectionView, p1Tag : Int, p2Tag : Int, gameSize: Int) -> Int {
        var checkForPlayer1 = true
        var checkForPlayer2 = true


//        Horizontal
        for column in 0...Int(gameSize-1){
            for row in 0...Int(gameSize-1) {

                let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: column)) as! TicTacToeCollectionViewCell

                if cell.theTag != p1Tag {
                    checkForPlayer1 = false
                }
                if cell.theTag != p2Tag {
                    checkForPlayer2 = false
                }
            }


            if checkForPlayer1{
                return 1
            }else if checkForPlayer2{
                return 2
            }else{
                checkForPlayer1 = true
                checkForPlayer2 = true
            }


        }


        //Vertical Check
        for row in 0...Int(gameSize-1){
            for column in 0...Int(gameSize-1) {
                let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: column)) as! TicTacToeCollectionViewCell

                if cell.theTag != p1Tag {
                    checkForPlayer1 = false
                }
                if cell.theTag != p2Tag {
                    checkForPlayer2 = false
                }
            }
            if checkForPlayer1{
                return 1
            }else if checkForPlayer2{
                return 2
            }else{
                checkForPlayer1 = true
                checkForPlayer2 = true
            }
        }

        //Right Diagonal Check
        for row in 0...Int(gameSize-1){
            let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: row)) as! TicTacToeCollectionViewCell

            if cell.theTag != p1Tag {
                checkForPlayer1 = false
            }
            if cell.theTag != p2Tag {
                checkForPlayer2 = false
            }
        }
        if checkForPlayer1{
            return 1
        }else if checkForPlayer2{
            return 2
        }else{
            checkForPlayer1 = true
            checkForPlayer2 = true
        }

        //
        for row in 0...Int(gameSize-1){
            let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: Int(gameSize-1) - row)) as! TicTacToeCollectionViewCell
            if cell.theTag != p1Tag {
                checkForPlayer1 = false
            }
            if cell.theTag != p2Tag {
                checkForPlayer2 = false
            }
        }
        if checkForPlayer1{
            return 1
        }else if checkForPlayer2{
            return 2
        }else{
            checkForPlayer1 = true
            checkForPlayer2 = true
        }
        return 0
        }
}

