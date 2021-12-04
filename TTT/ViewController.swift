//
//  ViewController.swift
//  TTT
//
//  Created by administrator on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    var gameOver: Bool = false
    let tttGame = TTTGame()
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func button00(_ sender: UIButton) {
        updateUI(sender: sender, index1: 0, index2: 0)
    }

    @IBAction func button01(_ sender: UIButton) {
        updateUI(sender: sender, index1: 0, index2: 1)
    }
    
    @IBAction func button02(_ sender: UIButton) {
        updateUI(sender: sender, index1: 0, index2: 2)
    }
    
    @IBAction func button10(_ sender: UIButton) {
        updateUI(sender: sender, index1: 1, index2: 0)
    }
    
    @IBAction func button11(_ sender: UIButton) {
        updateUI(sender: sender, index1: 1, index2: 1)
    }
    
    @IBAction func button12(_ sender: UIButton) {
        updateUI(sender: sender, index1: 1, index2: 2)
    }
    
    @IBAction func button20(_ sender: UIButton) {
        updateUI(sender: sender, index1: 2, index2: 0)
    }
    
    @IBAction func button21(_ sender: UIButton) {
        updateUI(sender: sender, index1: 2, index2: 1)
    }
    
    @IBAction func button22(_ sender: UIButton) {
        updateUI(sender: sender, index1: 2, index2: 2)
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetGame()
    }
    
    
    private func updateUI(sender: UIButton, index1:Int, index2:Int){
        if !gameOver{
            if tttGame.blue == 1{
                sender.backgroundColor = UIColor.blue
                tttGame.blue = 0
                tttGame.red = 1
                tttGame.board[index1][index2] = 1
                if tttGame.checkWinner(1){
                    winnerLabel.text = "Blue is Winner"
                    gameOver = true
                }
            }else if tttGame.red == 1{
                sender.backgroundColor = UIColor.red
                tttGame.red = 0
                tttGame.blue = 1
                tttGame.board[index1][index2] = 2
                if tttGame.checkWinner(2){
                    winnerLabel.text = "Red is Winner"
                    gameOver = true
                }
            }
            sender.isEnabled = false
        }
    }
    
    private func resetGame(){
        button00.backgroundColor = UIColor.gray
        button00.isEnabled = true
        button01.backgroundColor = UIColor.gray
        button01.isEnabled = true
        button02.backgroundColor = UIColor.gray
        button02.isEnabled = true
        button10.backgroundColor = UIColor.gray
        button10.isEnabled = true
        button11.backgroundColor = UIColor.gray
        button11.isEnabled = true
        button12.backgroundColor = UIColor.gray
        button12.isEnabled = true
        button20.backgroundColor = UIColor.gray
        button20.isEnabled = true
        button21.backgroundColor = UIColor.gray
        button21.isEnabled = true
        button22.backgroundColor = UIColor.gray
        button22.isEnabled = true
        
        winnerLabel.text = ""
        gameOver = false
        tttGame.resetGame()
    }
}


