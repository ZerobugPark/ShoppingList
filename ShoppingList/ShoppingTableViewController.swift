//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var shopInfo = ShoppingInfoList(){
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 70
        tableView.keyboardDismissMode = .onDrag
        configuration()
    }
    
    private func configuration() {
        backgroundView.backgroundColor = #colorLiteral(red: 0.9568622708, green: 0.9568629861, blue: 0.9740719199, alpha: 1)
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderColor = UIColor.clear.cgColor
        
        
        inputTextField.placeholder = "무엇을 구매하실 건가요?"
        inputTextField.backgroundColor = .clear
        inputTextField.borderStyle = .none
        
        addButton.setTitle("추가", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        addButton.setTitleColor(.black, for: .normal)
        addButton.setTitleColor(.blue, for: .highlighted)
        addButton.layer.cornerRadius = 10
        addButton.layer.borderWidth = 0
        addButton.backgroundColor = #colorLiteral(red: 0.9098034501, green: 0.9098041654, blue: 0.9270122647, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shopInfo.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewController", for: indexPath) as! ShoppingTableViewCell
        
        let row = indexPath.row
        
        cell.mainLabel.text = shopInfo.list[row].title
        
        
        let checkImage = shopInfo.list[row].checkStatus ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        
        
        
        cell.checkButton.tag = row
        
        
        
        cell.checkButton.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
        
        
        
        let likeImage = shopInfo.list[row].likeStatus ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        
        
        
        
        cell.likeButton.tag = row
        
        cell.backgroundColor = #colorLiteral(red: 0.9568622708, green: 0.9568629861, blue: 0.9740719199, alpha: 1)
        
        cell.likeButton.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)
        
        
        return cell
    }
    
    
    @IBAction func addShoppingList(_ sender: UIButton) {
        
        if let text = inputTextField.text {
            inputTextField.text = ""
            shopInfo.list.append(ShoppingStatus(checkStatus: false, title: text, likeStatus: false))
        }
    }
    
    
    @objc private func checkBtnTapped(_ sender: UIButton) {
        
        print("check")
        shopInfo.list[sender.tag].checkStatus.toggle()
        tableView.reloadData()
        
    }
    
    @objc private func likeBtnTapped(_ sender: UIButton) {
        
        print("like")
        shopInfo.list[sender.tag].likeStatus.toggle()
        tableView.reloadData()
        
    }
    
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
    }
    

}
