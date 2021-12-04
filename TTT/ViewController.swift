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
        tttGame.blue = 1
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
        button00.backgroundColor = .gray
        button01.backgroundColor = .gray
        button02.backgroundColor = .gray
        button10.backgroundColor = .gray
        button11.backgroundColor = .gray
        button12.backgroundColor = .gray
        button20.backgroundColor = .gray
        button21.backgroundColor = .gray
        button22.backgroundColor = .gray
        
        winnerLabel.text = ""
        gameOver = false
        tttGame.resetGame()
    }
}


