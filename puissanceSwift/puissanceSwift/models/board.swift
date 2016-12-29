//
//  board.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class Board{
    
    let number_of_raw = 6
    let number_of_column = 7
    let empty = 0
    let player1 = 1
    let player2 = 2
    
    var last_box_played = ["raw":0, "column": 0, "player": 0]
    
    var boxes: [[Int]]
    
    init(){
        //Creer un tableau de 7 cases correspondant aux lignes et contenant sur chacune d'elle un tableau de 7 cases correspondant aux colonnes
        boxes = Array(repeating: Array(repeating: 0, count: number_of_column), count: number_of_raw)
    }
    
    func isEmpty(_ object:Int) -> Bool{
        if object == empty{
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
    
    func add(column:Int, player:Int){
        var new_raw = 0 //designe la ligne ou on va poser le pion
        for raw in boxes{
            if isEmpty(raw[column]) == true{
                if new_raw == number_of_raw - 1{
                    boxes[new_raw][column] = player
                    break
                }else{
                    new_raw += 1
                }
            }else{
                guard new_raw > 0 else{
                    break
                }
                new_raw -= 1
                boxes[new_raw][column] = player
                break
            }
        }
        last_box_played["raw"] = new_raw
        last_box_played["column"] = column
        last_box_played["player"] = player
    }
    
    func remove(){
        let box = boxes[last_box_played["raw"]!][last_box_played["column"]!]
        if isEmpty(box) == false{
            boxes[last_box_played["raw"]!][last_box_played["column"]!] = 0
        }
    }
    
}
