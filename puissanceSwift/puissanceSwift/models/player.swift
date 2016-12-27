//
//  player.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class Player{
    
    let id: Int
    
    init(_ id:Int){
        self.id = id
    }
        
    func add(board:Board, raw:Int, column:Int) {
        if board.isEmpty(board.boxes[raw][column]) == true{
            board.add(column:column, player: id)
        }
    }
}
