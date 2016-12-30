//
//  AI.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class AI{
    
    let level: Int
    var block_player = false
    var play_at_random_position = false
    var try_to_win = false
    
    var scale_to_diagonal = 0
    var scale_to_vertical = 0
    var scale_to_horizontal = 0
    
    init(_ level: Int){
        self.level = level
        get_scales_by_level()
    }
    
    func make_action(scale:Int)->Bool{
        let random_num: UInt32 = arc4random_uniform(100)
        let num: Int = Int(random_num)
        
        if num >= 0 && num <= scale{
            return true
        }
        return false
    }
    
    func get_scales_by_level(){
        if level == 1 {
            scale_to_diagonal = 20
            scale_to_vertical = 50
            scale_to_horizontal = 50
        }
        else if level == 2{
            scale_to_diagonal = 50
            scale_to_horizontal = 75
            scale_to_vertical = 75
        }
        else{
            scale_to_diagonal = 75
            scale_to_vertical = 100
            scale_to_horizontal = 100
        }
    }
    
    func select_action_of_ai(){
    }
    
    func player_can_win() -> Bool{
        if can_win_on_horizontal(){
            if make_action(scale: scale_to_horizontal) == true{
                block_player = true
                play_at_random_position = false
                return true
            }
        }
        else if can_win_on_vertical() == true{
            if make_action(scale: scale_to_vertical) == true{
                block_player = true
                play_at_random_position = false
                return true
            }
        }
        else if can_win_on_diagonal() == true{
            if make_action(scale: scale_to_diagonal) == true{
                block_player = true
                play_at_random_position = false
                return true
            }
        }
        else{
            block_player = false
            play_at_random_position = true
            return false
        }
        return false
    }
    
    func can_win_on_diagonal() -> Bool{
        return false
    }
    
    func can_win_on_vertical() -> Bool{
        return false
    }
    
    func can_win_on_horizontal() -> Bool{
        return false
    }
    
    
}
