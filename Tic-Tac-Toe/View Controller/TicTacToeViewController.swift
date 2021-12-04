//
//  TicTacToeViewController.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-01.
//

import UIKit

private let gameIdentifier = "gameIdentifier"


class TicTacToeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var playCollectionView: UICollectionView!

    var player1 = Player()
    var player2 = Player()
    var playActions = PlayerActions()

    
    var gamePlan = GamePlan()
    
    
    
    let image = Images(xImage: UIImage(named: "x")!, oImage: UIImage(named: "o")!, defaultImage: UIImage(named: "kvadrat")!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamePlan.playSize = 3
   

        player1.theTag = 1
        
        player2.theTag = 2
        
    
        
        let flowlayout = UICollectionViewFlowLayout()
       
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 1
        flowlayout.minimumInteritemSpacing = 1
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowlayout.itemSize = CGSize(width: (view.frame.size.width/gamePlan.rate), height: (view.frame.size.width/gamePlan.rate))
        
        playCollectionView.dataSource = self
        playCollectionView.delegate = self
        playCollectionView.collectionViewLayout = flowlayout
 
    }
    

    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return gamePlan.playSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamePlan.playSize
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Int(collectionView.bounds.width) - 5) / gamePlan.playSize, height: (Int(collectionView.bounds.size.height) - 5) / gamePlan.playSize)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playCollectionView.dequeueReusableCell(withReuseIdentifier: gameIdentifier, for: indexPath) as! TicTacToeCollectionViewCell
        cell.theTag = 0
        cell.imageView.image = image.defaultImage
        return cell
    }
    

  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
        let cell = playCollectionView.cellForItem(at: indexPath) as! TicTacToeCollectionViewCell
        if cell.imageView.image == image.defaultImage{
            
        
        if player1.aktiv == true {
            cell.imageView.image = image.oImage
            player1.aktiv.toggle()
            cell.theTag = player1.theTag
            playerNameLabel.text = "\(player1.playerName) is playing now"
        } else {
            cell.imageView.image = image.xImage
            player1.aktiv.toggle()
            cell.theTag = player2.theTag
            playerNameLabel.text = "\(player2.playerName) is playing now"
        }
        }
        gamePlan.positionsCell.append(cell.theTag)
//        checkItNumber(cVW: collectionView)
        let valueT = playActions.checkItNumber(cVW: collectionView, p1Tag: player1.theTag, p2Tag: player2.theTag, gameSize: gamePlan.playSize)
        if valueT == 1 {
            player1.playerWin = true
        } else if valueT == 2 {
            player2.playerWin = true
        }
        
        updateView()



        if gamePlan.positionsCell.count == Int(gamePlan.playSize)*Int(gamePlan.playSize){
            if !player1.playerWin && !player2.playerWin{
                showAlertViewWith(message: "It's a Tie")
            }
        }
        
        
    }
    
    func updateView(){
        print(player1.playerWin)
        if player1.playerWin {
            showAlertViewWith(message: player1.playerName + " Player 1 Won!!")
        }else if player2.playerWin {
            showAlertViewWith(message: player2.playerName + " Player 2 Won!!")
        }else{
//            if player1.isHisTurn {
//                titleLabel.text = player1.playerName+"'s Turn"
//            }else{
//                titleLabel.text = player2.playerName+"'s Turn"
//            }
        }
    }
        
    
    func reloadGame(){
        gamePlan.positionsCell = []
        player1.playerWin = false
        player2.playerWin = false
        updateView()
        playCollectionView.reloadData()
    }
    
    func showAlertViewWith(message: String){
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.reloadGame()
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    func checkItNumber(cVW : UICollectionView) {
        var resultP1 = true
        var resultP2 = true

//        Horizontal
        for column in 0...Int(gamePlan.playSize-1){
            for row in 0...Int(gamePlan.playSize-1) {
                
                let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: column)) as! TicTacToeCollectionViewCell
                if cell.theTag != player1.theTag{
                    resultP1 = false
                }
                if cell.theTag != player2.theTag{
                    resultP2 = false
                }
               
            }
            
            if resultP1{
                player1.playerWin = true
                
                return
            }else if resultP2{
                player2.playerWin = true
        
                return
            }else{
                resultP1 = true
                resultP2 = true
            }
        }
        
        
        //Vertical Check
        for row in 0...Int(gamePlan.playSize-1){
            for column in 0...Int(gamePlan.playSize-1) {
                let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: column)) as! TicTacToeCollectionViewCell
               
                if cell.theTag != player1.theTag{
                    resultP1 = false
                }
                if cell.theTag != player2.theTag{
                    resultP2 = false
                }
            }
            if resultP1{
                player1.playerWin = true
                return
            }else if resultP2{
                player2.playerWin = true
                return
            }else{
                resultP1 = true
                resultP2 = true
            }
        }
        
        //Right Diagonal Check
        for row in 0...Int(gamePlan.playSize-1){
            let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: row)) as! TicTacToeCollectionViewCell
       
            if cell.theTag != player1.theTag{
                resultP1 = false
            }
            if cell.theTag != player2.theTag{
                resultP2 = false
            }
        }
        if resultP1{
            player1.playerWin = true
            return
        }else if resultP2{
            player2.playerWin = true
            return
        }else{
            resultP1 = true
            resultP2 = true
        }
        
        //Left Diagonal Check
        for row in 0...Int(gamePlan.playSize-1){
            let cell = cVW.cellForItem(at: IndexPath.init(row: row, section: Int(gamePlan.playSize-1) - row)) as! TicTacToeCollectionViewCell
            if cell.theTag != player1.theTag{
                resultP1 = false
            }
            if cell.theTag != player2.theTag{
                resultP2 = false
            }
        }
        if resultP1{
            player1.playerWin = true
            return
        }else if resultP2{
            player2.playerWin = true
            return
        }else{
            resultP1 = true
            resultP2 = true
        }
        }
    
      
}

