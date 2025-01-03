//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var shopInfo = ShoppingInfoList()
    var titleList: [String] = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기"]
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 70
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
        
        return titleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewController", for: indexPath)
        
        
        
        
        cell.backgroundColor = #colorLiteral(red: 0.9568622708, green: 0.9568629861, blue: 0.9740719199, alpha: 1)
        
        
        return cell
    }
    
    
 

}
