//
//  TicTacToeViewController.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-01.
//

import UIKit

private let gameIdentifier = "gameIdentifier"

class TicTacToeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    
    @IBOutlet weak var playCollectionView: UICollectionView!
    
    var player1 = Player()
    var player2 = Player()
    
    var tableNumber : [Int] = []
    
    var row : Int = 7
    var rate: CGFloat = 0
    var gamePlan = GamePlan()
    
    
    let image = Images(xImage: UIImage(named: "x")!, oImage: UIImage(named: "o")!, defaultImage: UIImage(named: "background")!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rate = CGFloat(self.row + 1)
        gamePlan = GamePlan(row: row, rate : CGFloat(self.row + 1))
        
        let mult = row * row
        for i in 0...Int(mult-1) {
            tableNumber.append(i*34)
        }
        
        let flowlayout = UICollectionViewFlowLayout()
       
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 1
        flowlayout.minimumInteritemSpacing = 1
        flowlayout.itemSize = CGSize(width: (view.frame.size.width/gamePlan.rate), height: (view.frame.size.width/gamePlan.rate))
        
        playCollectionView.dataSource = self
        playCollectionView.delegate = self
        playCollectionView.collectionViewLayout = flowlayout
 
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamePlan.row * gamePlan.row
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playCollectionView.dequeueReusableCell(withReuseIdentifier: gameIdentifier, for: indexPath) as! TicTacToeCollectionViewCell
        
        cell.imageView.image = image.defaultImage
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = playCollectionView.cellForItem(at: indexPath) as! TicTacToeCollectionViewCell
        
        if player1.aktiv == true {
            cell.imageView.image = image.oImage
            player1.aktiv.toggle()
            player1.positions.append(indexPath)
            tableNumber[indexPath.row] = 1
            cell.theTag = player1.theTag
            print(player1.positions)
            
        } else {
            cell.imageView.image = image.xImage
            player1.aktiv.toggle()
            player2.positions.append(indexPath)
            cell.theTag = player2.theTag
            tableNumber[indexPath.section] = 2
            print(indexPath.row)
            print(indexPath.section)
            
            for i in player2.positions{
                print(i)
            }
        }
        checkItNumber1(cVW: collectionView)
    }

 
    func checkItNumber1(cVW : UICollectionView) {
        for y in 0...Int(row-1){
            for x in 0...Int(row-1) {
                let cell = cVW.cellForItem(at: IndexPath.init(row: x, section: y)) as! TicTacToeCollectionViewCell
                if cell.theTag == player2.theTag {
                    print("fdfd")
                }
            }
        }
    }
    
    func checkItNumber(){
            let winner = "nureddin"
        if (tableNumber[0] == tableNumber[1] && tableNumber[0] == tableNumber[2]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        if (tableNumber[3] == tableNumber[4] && tableNumber[3] == tableNumber[5]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        if (tableNumber[6] == tableNumber[7] && tableNumber[6] == tableNumber[8]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        
        
        if (tableNumber[0] == tableNumber[3] && tableNumber[0] == tableNumber[6]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()

        }
        if (tableNumber[1] == tableNumber[4] && tableNumber[1] == tableNumber[7]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        if (tableNumber[2] == tableNumber[5] && tableNumber[2] == tableNumber[8]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        
        
        if (tableNumber[0] == tableNumber[4] && tableNumber[0] == tableNumber[8]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        if (tableNumber[2] == tableNumber[4] && tableNumber[2] == tableNumber[6]){
            makeAlert(title: "Bravo \(winner.uppercased())!", message: "You win! ")
            waitForNewPlay()
        }
        
        func makeAlert(title: String, message: String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let playAgainButton = UIAlertAction(title: "Play Again", style: .default) { task in
             
                
                
            }
            let finishButton = UIAlertAction(title: "Finish", style: .cancel) { task in
                print("finished")
            }
            
            alert.addAction(playAgainButton)
            alert.addAction(finishButton)
            present(alert, animated: true, completion: nil)
        }
        
        func waitForNewPlay(){
          
        }
}
}
