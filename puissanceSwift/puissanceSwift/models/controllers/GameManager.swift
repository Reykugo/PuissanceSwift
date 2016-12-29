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
    var player2 = Player(2)
    
    var turn_of = 1;
    
    var win = 0

    
    func test(){
        //test_remove()
        //test_switch_turn()
        //test_stacking_pawns()
        //test_win_horizontal()
        
        test_win_vertical()
    }
    
    func play_turn(column:Int){
        if board.last_box_played["player"] == turn_of{
            board.remove()
        }
        if turn_of == 1{
            player1.add(board: board,  column: column)
        
        }else{
            player2.add(board: board, column: column)
        }
        win = check_win(board: board)
        
    }
    
    func validate_turn(){
        if win == 0{
            if turn_of == 1{
                turn_of = 2
            }else{
                turn_of = 1
            }
        }else{
            print("player \(win) have win!!!")
        }
    }
    
///////////////////JEUX TEST///////////////////////////////////////
    
    func test_remove(){
        play_turn(column:5)
        print(board.boxes)
        print(" ")
        
        play_turn(column:1)
        print(board.boxes)
        print(" ")
    }
    
    func test_switch_turn(){
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(column:3)
        print(board.boxes)
        print(" ")
    }
    
    func test_stacking_pawns(){
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(column:1)
        print(board.boxes)
        print(" ")
    }
    
    func test_win_horizontal(){
        
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(column: 2)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        validate_turn()
        
        play_turn(column: 3)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        play_turn( column:1)
        print(board.boxes)
        print(" ")
        validate_turn()
        
        play_turn( column: 4)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
    }
    
    func test_win_vertical(){
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(column: 2)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        play_turn(column:1)
        print(board.boxes)
        print(" ")
        validate_turn()
        
        play_turn(column: 3)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        play_turn( column:1)
        print(board.boxes)
        print(" ")
        validate_turn()
        
        play_turn( column: 5)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn( column:1)
        print(board.boxes)
        print(" ")
        validate_turn()
    }
///////////////////////////////////////////////////////////////////////////
}
