//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var shopInfo = ShoppingInfoList()
//    {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
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
            
   //         print(indexPath)
            //리스트를 먼저 지우고, 테이블 뷰를 지워야함.
            self.shopInfo.list.remove(at: indexPath.row)
            // 테이블 뷰는 데이터를 가지고 지우는거기 때문에, 먼저 테이블뷰를 지울 경우 list에는 아직 남아있는 상황
            // 즉 tableView(_:cellForRowAt:)가 그릴 때 indexPath와 list간의 차이가 있음.
            tableView.deleteRows(at: [indexPath], with: .fade)
   
//            deleteRows(at:with:) 사용:
//            데이터를 **부분적으로 수정(삽입, 삭제, 이동)**할 때.
//            애니메이션 효과를 적용해 부드러운 사용자 경험을 제공하고 싶을 때.
//            reloadData() 사용:
//            테이블의 데이터가 완전히 변경되거나 전체를 다시 그려야 할 때.
//            간단한 UI 갱신이 필요하고 애니메이션이 중요하지 않을 때.
          
            // 어차피 둘다 아래 함수 호출 함
           // tableView(_:numberOfRowsInSection:): 섹션당 남아 있는 행(Row)의 개수를 확인.
           // tableView(_:cellForRowAt:): 변경된 데이터에 따라 필요한 새로운 셀을 요청.

            complete(true)
            
        }
        del.backgroundColor = .red
        
        
        //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[del])

    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let test = UIContextualAction(style: .normal, title: "") { (_, _, complete: @escaping (Bool) -> Void) in
//            let alert = UIAlertController(title: "알림", message: "좋아요가 눌려졌어요", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "확인", style: .default)
//            
//            alert.addAction(ok)
//            self.present(alert,animated: true)
    
            complete(false) // false나 true나 동작에 차이는 없음 단, complete 안써줄 경우 스와이프에 그대로 남아있음
            // 내부적으로 어떻게 동작하는지는 잘 모르겠네.
        }
        test.image = UIImage(systemName: "hand.thumbsup")
        
        //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[test])

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
            if !text.isEmpty {
                shopInfo.list.append(ShoppingStatus(checkStatus: false, title: text, likeStatus: false))
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
        
        shopInfo.list[sender.tag].checkStatus.toggle()
        tableView.reloadData()
        
    }
    
    @objc private func likeBtnTapped(_ sender: UIButton) {
        
        shopInfo.list[sender.tag].likeStatus.toggle()
        tableView.reloadData()
        
    }
    
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
    }
    

}
