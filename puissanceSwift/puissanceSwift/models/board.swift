//
//  board.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class Board{
    
    let empty = 0
    let player1 = 1
    let player2 = 2
    
    var last_box_played = ["raw":0, "column": 0]
    
    var boxes: [[Int]]
    
    init(){
        //Creer un tableau de 7 cases correspondant aux lignes et contenant sur chacune d'elle un tableau de 7 cases correspondant aux colonnes
        boxes = Array(repeating: Array(repeating: 0, count: 7), count: 7)
        print(boxes)
    }
    
    func isEmpty(raw:Int, column:Int) -> Bool{
        if boxes[raw][column] == empty{
            return true
        }
        return false
    }
    
    func IsFull() -> Bool{
        for raw in boxes{
            for box in raw{
                if box != empty{
                    return false
                }
            }
        }
        return true
    }
    
    func add(raw:Int, column:Int, player:Int){
        boxes[raw][column] = player
        last_box_played["raw"] = raw
        last_box_played["column"] = column
    }
    
    func remove(){
        if isEmpty(raw: last_box_played["raw"]!, column: last_box_played["column"]!) == false{
            boxes[last_box_played["raw"]!][last_box_played["column"]!] = 0
        }
    }
    
}
