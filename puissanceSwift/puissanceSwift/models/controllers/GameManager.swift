//
//  GameManager.swift
//  PuissanceSwift
//
//  Created by Developer on 27/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class GameManager: Rules{
    
    var board = Board()
    var player1 = Player(1)
    var player2 = AI(1) // ai considerate like player at begin(function of ai don't used)
    
    var play_with_ai = false
    
    var turn_of = 1;
    
    var win = 0
    
    func play_turn(column:Int){
        if turn_of == 1{
            player1.add(board: board,  column: column)
        
        }else{
            player2.add(board: board, column: column)
        }
        win = check_win(board: board)
        validate_turn()
    }
    
    func play_turn_of_ai(){
        player2.select_action_of_ai(board: board)
        win = check_win(board: board)
        validate_turn()
    }
    
    func validate_turn(){
        if win == 0{
            if turn_of == 1{
                turn_of = 2
            }else{
                turn_of = 1
            }
        }else{
            print("player \(win) has win!!!")
        }
    }
    
    func reset_game(){
        board = Board()
        win = 0
        turn_of = 1
    }
    
}
