//
//  ViewController.swift
//  CardWarGame
//
//  Created by Roei Barkan on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var panel_IMG_card1: UIImageView!
    @IBOutlet weak var panel_IMG_card2: UIImageView!
    @IBOutlet weak var panel_LBL_score1: UILabel!
    @IBOutlet weak var panel_LBL_score2: UILabel!
    @IBOutlet weak var panel_BTN_startGame: UIButton!
    @IBOutlet weak var panel_LBL_winner: UILabel!
    
    var cards: [UIImageView]!
    var player1_score: Int = 0
    var player2_score: Int = 0
    weak var timer: Timer?
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [panel_IMG_card1,panel_IMG_card2]
    }
    
    
    @IBAction func playClicked(_ sender: Any) {
        panel_BTN_startGame.setImage(UIImage(named: "yellow_clock"), for: .normal)
        panel_BTN_startGame.imageView?.layer.transform = CATransform3DMakeScale(0.15, 0.15, 0.15)
        panel_BTN_startGame.isEnabled = false
        flipCards()
        counter += 1
        startTimer()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            self.flipCards()
            self.counter += 1
            
            if self.counter == 15{
                timer.invalidate()
                self.checkWinner()
            }
        }
        
    }
    
    func flipCards(){
        let images = [UIImage(named: "poker_card_a2"), UIImage(named: "poker_card_a3"),UIImage(named: "poker_card_a4"),UIImage(named: "poker_card_a5"),UIImage(named: "poker_card_a6"),UIImage(named: "poker_card_a7"),UIImage(named: "poker_card_a8"),UIImage(named: "poker_card_a9"),UIImage(named: "poker_card_a10"),UIImage(named: "poker_card_a11"),UIImage(named: "poker_card_a12"),UIImage(named: "poker_card_a13"),UIImage(named: "poker_card_a14")]
        var rands: [Int] = Array(0 ..< cards.count)
        
        for i in 0 ..< rands.count{
            let rand = Int.random(in: 0 ..< images.count)
            rands[i] = rand
            cards[i].image = images[rand]
        }
        checkCards(arr: rands)
        panel_LBL_score1.text = "\(player1_score)"
        panel_LBL_score2.text = "\(player2_score)"
    }
    
    func checkCards(arr: [Int]){
        if(arr[0] > arr[1]){
            player1_score += 1
        }else if(arr[1] > arr[0]){
            player2_score += 1
        }
    }
    
    func checkWinner(){
        panel_IMG_card1.isHidden = true
        panel_IMG_card2.isHidden = true
        panel_LBL_winner.isHidden = false
        if player1_score > player2_score{
            panel_LBL_winner.text = "Player 1 Wins!"
        }else if player2_score > player1_score{
            panel_LBL_winner.text = "Player 2 Wins!"
        }
    }
    
}

