//
//  TTTGame.swift
//  TTT
//
//  Created by administrator on 02/12/2021.
//

import Foundation

class TTTGame {
    var blue: Int = 0
    var red: Int = 0
    var board: [[Int]] =
    [
    [0,0,0],
    [0,0,0],
    [0,0,0]
    ]
    
    func checkWinner(_ number: Int) -> Bool {
        var result = false
        
        for i in 0...2{
            // rowCrossed
            if self.board[i][0] == self.board[i][1] && self.board[i][1] == self.board[i][2] && self.board[i][1] == number{
                result = true
                break
            }
            // columnCrossed
            if self.board[0][i] == self.board[1][i] && self.board[1][i] == self.board[2][i] && self.board[1][i] == number{
                result = true
                break
            }
        }
        //diagonalCrossed
        if (self.board[0][0] == self.board[1][1] && self.board[1][1] == self.board[2][2]) && self.board[1][1] == number{
            result = true
        }
        if (self.board[0][2] == self.board[1][1] && self.board[1][1] == self.board[2][0]) && self.board[1][1] == number{
            result = true
        }
        
        return result
    }
    
    func resetGame(){
        self.blue = 1
        self.board =
        [
        [0,0,0],
        [0,0,0],
        [0,0,0]
        ]
    }
}
