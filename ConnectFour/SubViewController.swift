//
//  SubViewController.swift
//  ConnectFour
//
//  Created by Dylan Westfall on 5/10/18.
//  Copyright © 2018 Dylan Westfall. All rights reserved.
//

import UIKit

class customCell: UITableViewCell{
    @IBOutlet weak var texting: UITextView!
    
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
        
        return cell
    }
    
  

}
