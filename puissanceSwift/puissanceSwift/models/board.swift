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
    
    var last_box_played = 0
    
    var boxes: [Int]
    
    init(){
        boxes = Array(repeating: 0, count: 49)
    }
    
    func isEmpty(box:Int) -> Bool{
        if boxes[box] == empty{
            return true
        }
        return false
    }
    
    func IsFull() -> Bool{
        for box in boxes{
            if box != empty{
                return false
            }
        }
        return true
    }
    
    func add(box:Int, player:Int){
        boxes[box] = player
        last_box_played = box
    }
    
    func remove(){
        if isEmpty(box: last_box_played) == false{
            boxes[last_box_played] = 0
        }
    }
    
}
