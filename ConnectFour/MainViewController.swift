//
//  MainViewController.swift
//  ConnectFour
//
//  Created by Dylan Westfall on 5/9/18.
//  Copyright © 2018 Dylan Westfall. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // -- basic vars and wins variables --
    @IBOutlet var coins: [UIImageView]!
    
    
    var turn: String = "red"
    var redWins: Int = 0
    var redLoss: Int = 0
    var greenWins: Int = 0
    var greenLoss: Int = 0
    var winner: Bool = false
    var actualGameCounter: Int = 0
    var moveList: [String] = ["Start of Game"]
    
    // --- colm code --
    @IBAction func col0(_ sender: Any) {
        placing(place: 0)
    }
    
    @IBAction func col1(_ sender: Any) {
        placing(place: 1)
    }
    
    @IBAction func col2(_ sender: Any) {
        placing(place: 2)
    }
    
    @IBAction func col3(_ sender: Any) {
        placing(place: 3)
    }
    
    @IBAction func col4(_ sender: Any) {
        placing(place: 4)
    }
    
    @IBAction func col5(_ sender: Any) {
        placing(place: 5)
    }
    
    @IBAction func col6(_ sender: Any) {
        placing(place: 6)
    }
    
    @IBOutlet weak var colm0: UIButton!
    @IBOutlet weak var colm1: UIButton!
    @IBOutlet weak var colm2: UIButton!
    @IBOutlet weak var colm4: UIButton!
    @IBOutlet weak var colm5: UIButton!
    @IBOutlet weak var colm6: UIButton!
    @IBOutlet weak var colm7: UIButton!
    
    
    // --- aux labels ---
    @IBOutlet weak var turnShower: UIImageView!
    
    @IBOutlet weak var winRed: UILabel!
    
    @IBOutlet weak var winGreen: UILabel!
    
    @IBOutlet weak var loseRed: UILabel!
    
    @IBOutlet weak var loseGreen: UILabel!
    
    @IBOutlet weak var gameCounter: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // placement based code
    func placing(place: Int){
        
            if(!winner){
                drop(place: (place * 7))
        }
        
    }
    
   
    
    // checking and validation methods
    func drop(place: Int){
        if(coins[place + 6].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place + 6], num: place + 6, colmn: place)
        }else if(coins[place + 5].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place + 5], num: place + 5, colmn: place)
        }else if(coins[place + 4].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place + 4], num: place + 4, colmn: place)
        }else if(coins[place + 3].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place + 3], num: place + 3, colmn: place)
        }else if(coins[place + 2].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place + 2], num: place + 2, colmn: place)
        }else if(coins[place + 1].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place + 1], num: place + 1, colmn: place)
        }else if(coins[place].image == #imageLiteral(resourceName: "blankCoin.png")){
            FinalCheck(coin: coins[place], num: place, colmn: place)
        }
    }
    
    func FinalCheck(coin: UIImageView, num: Int, colmn: Int){
        flip(coin: coin)
        actualGameCounter = actualGameCounter + 1
        gameCounter.text = String(actualGameCounter)
        didWin(place: num, colmn: colmn)
        if(!winner){
        switchTurns()
        }
    }
    
    // wining functions
    func didWin(place: Int, colmn: Int){
        let x1st = ("move: " + gameCounter.text!)
        let x2nd = (" player: " + turn)
        let x3rd = (" placed coin at x: " + String(place / 7 ))
        let x4th = (" y:" + String(place % 7))
        moveList.append(x1st + x2nd + x3rd + x4th)
        if(colmnCheck(colm: colmn) || rowCheck(place: place) || forwardDiagonalCheck(place: place) || backwardDiagonalCheck(place: place)){
            win()
        }
    }
    
    func colmnCheck(colm: Int) -> Bool{
        var arm: [Int] = []
        let end: Int = colm + 6
        var mut: Int = colm
        while(mut <= end){
            arm.append(mut)
            mut = mut + 1
        }
        
        return checkRows(arCheck: arm)
    }
    
    func rowCheck(place: Int) -> Bool{
        var arm: [Int] = []
        var start: Int = place % 7
        let end: Int = 48 - (6 - start)
        while(start <= end){
            arm.append(start)
            start = start + 7
        }
        
        return checkRows(arCheck: arm)
    }
    
    func forwardDiagonalCheck(place: Int) -> Bool{
        var arm: [Int] = []
        let x: Int = place / 7
        let y: Int = place % 7
        var start = 0
        var end = 0
        if(x < y){
            if(x == 0 || y == 0){
                start = place
            }else {
            start = ((place - (1 * x) ) % 7)
            }
            if(y % 7 != 6){
            end = ((place + ((6 - y) * 8)))
            } else {
                end = place
            }
            }else if (x > y){
            start = (place - (y * 8) )
            if( x < 6){
            end = (place + ((6 - x) * 8))
            } else{
                end = place
            }
        } else{
            start = 0
            end = 48
        }
        
        while(start <= end){
            arm.append(start)
            start = start + 8
        }

        
        return checkRows(arCheck: arm)
    }
    
    func backwardDiagonalCheck(place: Int) -> Bool{
        var arm: [Int] = []
        let x: Int = place / 7
        let y: Int = place % 7
        var start = 0
        var end = 0
        if(y > x){
            if(x == 0){
                start = place
            }else if( y == 0){
                start = place
            }else if (y == 6){
                start = place
            }else{
          start = (place - ((x) * 6))
          end = (place + ((6 - x) * 6))
            }
        }else if (y < x){
            if(y > 0){
          start = (place - ((x - y + 1) * 6))
            } else{
               start = (place - ((x - y) * 6))
            }
            if(x == 6 || y == 0){
                end = place
            }else{
          end = (place + ((6 - x) * 6))
            }
        } else{
            if(x == 0){
            return false
            }else if(x == 1){
                return false
            }else if(x == 2){
                start = 4
                end = 28
            }else if(x == 3){
                start = 6
                end = 42
            }else if(x == 4){
                start = 20
                end = 44
            }else if(x == 5){
                return false
            }else{
                return false
            }
        }
        
        while(start <= end){
            arm.append(start)
            start = start + 6
        }

        return checkRows(arCheck: arm)
    }
    
    func checkRows(arCheck: [Int]) -> Bool{
        var chek: Bool = false
        var redCount: Int = 0
        var greenCount: Int = 0
        for x in arCheck{
            let coin: UIImage = coins[x].image!
            if(coin == #imageLiteral(resourceName: "blankCoin.png")){
                redCount = 0
                greenCount = 0
            }else if(coin == #imageLiteral(resourceName: "rc.png")){
                redCount = redCount + 1
                greenCount = 0
            }else{
                greenCount = greenCount + 1
                redCount = 0
            }
            
            if(redCount == 4 || greenCount == 4){
                chek = true
                return chek
            }
        }
        
        return chek
    }
    
    func win(){
        if(turn == "red"){
            winner = true
            redWins = redWins + 1
            greenLoss = greenLoss + 1
            winRed.text = String(redWins)
            loseGreen.text = String(greenLoss)
            let alert = UIAlertController(title: "Winner", message: "Player Red won in \(moveList.count - 1)  moves", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            winner = true
            redLoss = redLoss + 1
            greenWins = greenWins + 1
            winGreen.text = String(greenWins)
            loseRed.text  = String(redLoss)
            let alert = UIAlertController(title: "Winner", message: "Player Green won in \(moveList.count - 1)  moves", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // end of turn methods
    
    func switchTurns(){
    if(turn == "red"){
        turn = "green"
        turnShower.image = #imageLiteral(resourceName: "DQmSz68gJwYfsnnfLbjgeHABETm9QF4gnwkfKLTVwwn8SCg_1680x8400.png")
        colorSwap(color: .green)
    }else{
        turn = "red"
        turnShower.image = #imageLiteral(resourceName: "rc.png")
        colorSwap(color: .red)
        }
    }
    
    func colorSwap(color: UIColor){
         colm0.tintColor = color
         colm1.tintColor = color
         colm2.tintColor = color
         colm4.tintColor = color
         colm5.tintColor = color
         colm6.tintColor = color
         colm7.tintColor = color
    }
    
    // color changing coin methods
    func flip(coin: UIImageView){
        if(turn == "red"){
            coin.image = #imageLiteral(resourceName: "rc.png")
        }else{
            coin.image = #imageLiteral(resourceName: "DQmSz68gJwYfsnnfLbjgeHABETm9QF4gnwkfKLTVwwn8SCg_1680x8400.png")
        }
    }
    
    func rest(coin: UIImageView){
        coin.image = #imageLiteral(resourceName: "blankCoin.png")
    }
    
    // new game and reset methods
    
    
    @IBAction func NewGAme(_ sender: Any) {
        reset()
    }
    
    func reset(){
        turn = "red"
        actualGameCounter = 0
        gameCounter.text = "00"
        winner = false
        turnShower.image = #imageLiteral(resourceName: "rc.png")
        for coin in coins{
            rest(coin: coin)
        }
        colorSwap(color: .red)
        moveList = ["Start of Game"]
    }
    
    
    @IBAction func moveOver(_ sender: Any) {
        performSegue(withIdentifier: "pushToMoves", sender: Any.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "pushToMoves"){
            let seg = segue.destination as! SubViewController
            seg.moveList = self.moveList
            
        }
        
    }
}
