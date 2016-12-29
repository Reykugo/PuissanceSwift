//
//  rules.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class Rules{
    
    func winOnVertical (board: Board) -> Bool{
        let column = board.last_box_played["column"]
        let player = board.last_box_played["player"]
        
        var number_of_successive_pawns = 0
        
        for r in board.boxes{
            if r[column!] == player!{
                number_of_successive_pawns += 1
                if number_of_successive_pawns == 4{
                    break
                }
            }else{
                number_of_successive_pawns = 0
            }
        }
        if number_of_successive_pawns == 4{
            return true
        }
        return false
    }
    
    func winOnHorizontal (board: Board) -> Bool{
        let raw = board.last_box_played["raw"]!
        let player = board.last_box_played["player"]!
        
        var number_of_successive_pawns = 0
        
        for box in board.boxes[raw]{
            if box == player{
                number_of_successive_pawns += 1
                if number_of_successive_pawns == 4{
                    break
                }
            }else{
                number_of_successive_pawns = 0
            }
        }
        
        if number_of_successive_pawns == 4 {
            return true
        }
        
        return false
    }
    
    func winOnDiagonal (board: Board) -> Bool{
        return false
    }
    
    func check_win(board:Board) -> Int{
        if winOnVertical(board: board) == true{
            return board.last_box_played["player"]!
        }
        
        if winOnHorizontal(board: board) == true{
            return board.last_box_played["player"]!
        }
        
        return 0
    }
    
}
