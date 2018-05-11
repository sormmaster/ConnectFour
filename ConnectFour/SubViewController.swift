//
//  SubViewController.swift
//  ConnectFour
//
//

import UIKit

class customCell: UITableViewCell{
    @IBOutlet weak var texting: UITextView!
    
    @IBOutlet weak var greenCell: UIImageView!
    @IBOutlet weak var redCell: UIImageView!
}

class SubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var moveList: [String]!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "justCells", for: indexPath) as! customCell
        
        cell.texting.text = moveList[indexPath.row]
        if(indexPath.row == 0){
            cell.redCell.image = #imageLiteral(resourceName: "blankCoin.png")
            cell.greenCell.image = #imageLiteral(resourceName: "blankCoin.png")
        }else if(indexPath.row % 2 == 0){
            cell.redCell.image = #imageLiteral(resourceName: "blankCoin.png")
        }else{
            cell.greenCell.image = #imageLiteral(resourceName: "blankCoin.png")
        }
        
        return cell
    }
    
    
    
}
