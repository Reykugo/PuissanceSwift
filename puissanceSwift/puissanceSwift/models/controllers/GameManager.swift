//
//  GameManager.swift
//  PuissanceSwift
//
//  Created by Developer on 27/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class GameManager{
    
    var board = Board()
    var player1 = Player(1)
    var player2 = Player(2)
    
    var turn_of = 1;
    
    
    init(){
        
    }
    
    
    func test(){
        play_turn(raw:2, column:5)
        print(board.boxes)
        print(" ")
        
        play_turn(raw:3,column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(raw:3, column:1)
        print(board.boxes)
        print(" ")
        
        validate_turn()
        
        play_turn(raw: 1, column: 2)
        print(board.boxes)
        print(" ")
    }
    
    func play_turn(raw:Int, column:Int){
        if board.last_box_played["player"] == turn_of{
            board.remove()
        }
        if turn_of == 1{
            player1.add(board: board, raw: raw, column: column)
        }else{
            player2.add(board: board, raw: raw, column: column)
        }
        
    }
    
    func validate_turn(){
        if turn_of == 1{
            turn_of = 2
        }else{
            turn_of = 1
        }
    }
    

}
