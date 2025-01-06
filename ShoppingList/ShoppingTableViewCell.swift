//
//  ShoppingTableViewCell.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    
    static let identifier = "ShoppingTableViewController"
    
    
    @IBOutlet var checkButton: UIButton!
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 0.9568622708, green: 0.9568629861, blue: 0.9740719199, alpha: 1)
    }
    
    func configureDate(row: ShoppingStatus) {
        
        
        mainLabel.text = row.title
        
        let checkImage = row.checkStatus ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        
        
        let likeImage = row.likeStatus ? "star.fill" : "star"
        likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        
        
    }
    
}
