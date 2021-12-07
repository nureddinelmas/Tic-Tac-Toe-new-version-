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
    @IBOutlet weak var numberOfWinP2: UILabel!
    @IBOutlet weak var numberOfWinP1: UILabel!
    @IBOutlet weak var playCollectionView: UICollectionView!

    var player1 = Player()
    var player2 = Player()
    var playActions = PlayerActions()

    
    var gamePlan = GamePlan()
    
    
    
    let image = Images()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if player1.playerName == "" {
            player1.playerName = "First Player"
        }
        if player2.playerName == "" {
            player2.playerName = "Second Player"
        }
        playerNameLabel.text = "\(player1.playerName) is playing now"
        numberOfWinP1.text = "\(player1.playerName) : 0"
        numberOfWinP2.text = "\(player2.playerName) : 0"

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
       
        let valueT = playActions.checkItNumber(cVW: collectionView, p1Tag: player1.theTag, p2Tag: player2.theTag, gameSize: gamePlan.playSize)
       
        if valueT == 1 {
            player1.playerWin = true
        } else if valueT == 2 {
            player2.playerWin = true
        }
        
        updateView()



        if gamePlan.positionsCell.count == Int(gamePlan.playSize)*Int(gamePlan.playSize){
            if !player1.playerWin && !player2.playerWin{
                showAlertViewWith(message: "It's a Draw")
            }
        }
        
        
    }
    
    func updateView(){
        if player1.playerWin {
            player1.numberOfWin = player1.numberOfWin + 1
            numberOfWinP1.text = "\(player1.playerName) : \(player1.numberOfWin)"
            showAlertViewWith(message: player1.playerName + "  Won!!")
      
        }else if player2.playerWin {
            player2.numberOfWin = player2.numberOfWin + 1
            showAlertViewWith(message: player2.playerName + "  Won!!")
            numberOfWinP2.text = "\(player2.playerName) : \(player2.numberOfWin)"
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
    
}

