//
//  TicTacToeCollectionViewCell.swift
//  Tic-Tac-Toe
//
//  Created by Nureddin Elmas on 2021-12-01.
//

import UIKit

class TicTacToeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var theTag : Int = 0
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
}
