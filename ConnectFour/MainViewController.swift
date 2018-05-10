//
//  MainViewController.swift
//  ConnectFour
//
//  Created by Dylan Westfall on 5/9/18.
//  Copyright © 2018 Dylan Westfall. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var coins: [UIImageView]!
    var turn: String = "none"
    @IBOutlet var placers: [UIButton]!
    var redWins: Int = 0
    var greenWins: Int = 0
    var winner: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func placing(place: UIButton){
        if(turn == "red" || turn == "green"){
            if(!winner){
            if(turn == "red"){
                
            }else{
                
            }
        }
        }
    }
    
    func didWin(){
        
    }
    
    func win(){
        if(turn == "red"){
            
        }else{
            
        }
    }
    
    func check(coin: UIImageView){
        
    }
    
    func flip(coin: UIImageView){
        if(turn == "red"){
            coin.image = #imageLiteral(resourceName: "rc.png")
        }else{
            coin.image = #imageLiteral(resourceName: "DQmSz68gJwYfsnnfLbjgeHABETm9QF4gnwkfKLTVwwn8SCg_1680x8400.png")
        }
    }
    
    @IBAction func NewGAme(_ sender: Any) {
        turn = "red"
        winner = false
        for coin in coins{
            flip(coin: coin)
        }
        //flip(coin: coins[0])
    }
}
