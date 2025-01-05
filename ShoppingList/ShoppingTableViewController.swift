//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var shopInfo = ShoppingInfoList().list

    
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let del = UIContextualAction(style: .normal, title: "삭제") { (_, _, complete: @escaping (Bool) -> Void) in
            
            //리스트를 먼저 지우고, 테이블 뷰를 지워야함.
            self.shopInfo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            complete(true)
            
        }
        del.backgroundColor = .red
        
        
        //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[del])

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shopInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewController", for: indexPath) as! ShoppingTableViewCell
        
        let row = indexPath.row
        
        cell.mainLabel.text = shopInfo[row].title
        
        
        let checkImage = shopInfo[row].checkStatus ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        
        
        
        cell.checkButton.tag = row
        
        
        
        cell.checkButton.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
        
        
        
        let likeImage = shopInfo[row].likeStatus ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        
        
        
        
        cell.likeButton.tag = row
        
        cell.backgroundColor = #colorLiteral(red: 0.9568622708, green: 0.9568629861, blue: 0.9740719199, alpha: 1)
        
        cell.likeButton.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)
        
        
        return cell
    }
    
    
    @IBAction func addShoppingList(_ sender: UIButton) {
        
        if let text = inputTextField.text {
            if !text.isEmpty {
                shopInfo.append(ShoppingStatus(checkStatus: false, title: text, likeStatus: false))
                tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "알림", message: "상품을 입력해주세요.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
            
                alert.addAction(ok)
                present(alert,animated: true)
            }
            inputTextField.text = ""
        }
    }
    
    
    @objc private func checkBtnTapped(_ sender: UIButton) {
        
        shopInfo[sender.tag].checkStatus.toggle()
        tableView.reloadData()
        
    }
    
    @objc private func likeBtnTapped(_ sender: UIButton) {
        
        shopInfo[sender.tag].likeStatus.toggle()
        tableView.reloadData()
        
    }
    
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
    }
    

}
