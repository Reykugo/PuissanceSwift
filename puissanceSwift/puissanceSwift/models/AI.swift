//
//  AI.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import Foundation

class AI: Player{
    
    var level: Int
    var block_player = false
    
    var scale_to_diagonal = 0
    var scale_to_vertical = 0
    var scale_to_horizontal = 0
    
    var position_to_play = 0
    
    override init(_ level: Int){
        self.level = level
        super.init(2)
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
            scale_to_diagonal = 25
            scale_to_vertical = 75
            scale_to_horizontal = 50
        }
        else if level == 2{
            scale_to_diagonal = 50
            scale_to_horizontal = 75
            scale_to_vertical = 100
        }
        else{
            scale_to_diagonal = 75
            scale_to_vertical = 100
            scale_to_horizontal = 100
        }
    }
    
    func select_action_of_ai(board:Board){
        block_player = false
        position_to_play = 0
        if player_can_win(player: 1, board: board) == true && block_player == true{
            self.add(board: board, column: position_to_play)
        }
        else{
            choose_position_to_play(board: board)
        }
        
    }
    
    func choose_position_to_play(board:Board){
        if can_win_on_horizontal(player: 2, board: board) == true{
            self.add(board:board, column: position_to_play)
        }
        else if can_win_on_vertical(player: 2, board: board){
            self.add(board:board, column: position_to_play)
        }
        else if can_win_on_diagonal(player: 2, board: board){
            self.add(board:board, column: position_to_play)
        }
        else{
            play_at_random_position(board:board)
        }
    }
    
    func play_at_random_position(board:Board){
        let random_num: UInt32 = arc4random_uniform(UInt32(board.number_of_column - 1))
        let num: Int = Int(random_num)
        if board.column_isFull(column: num){
            play_at_random_position(board: board)
        }else{
            self.add(board:board, column: num)
        }
    }
    
    func player_can_win(player:Int, board:Board) -> Bool{
        if can_win_on_horizontal(player:player, board:board){
            if make_action(scale: scale_to_horizontal) == true{
                block_player = true
                return true
            }
        }
        else if can_win_on_vertical(player:player, board:board) == true{
            if make_action(scale: scale_to_vertical) == true{
                block_player = true
                return true
            }
        }
        else if can_win_on_diagonal(player:player, board:board) == true{
            if make_action(scale: scale_to_diagonal) == true{
                block_player = true
                return true
            }
        }
        else{
            block_player = false
            return false
        }
        return false
    }
    
    
    func can_win_on_vertical(player:Int, board:Board) -> Bool{
        
        var validate = true
        position_to_play = 0
        for raw in 0...board.number_of_raw - 1{
            for column in 0...board.number_of_column - 1{
                validate = true
                if board.boxes[raw][column] == player{
                    if raw <= board.number_of_raw - 3{
                        
                        guard board.column_isFull(column: column) == false else{
                            validate = false
                            continue
                        }
                        guard board.boxes[raw-1][column] == 0 else {
                            validate = false
                            continue
                        }
                        
                        guard board.boxes[raw+1][column] == player else{
                            validate = false
                            continue
                        }
                        guard board.boxes[raw+2][column] == player else{
                            validate = false
                            continue
                        }
                        
                        if validate{
                            position_to_play = column
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
    func can_win_on_horizontal(player:Int, board:Board) -> Bool{
        
        for raw in 0...board.number_of_raw - 1{
            for column in 0...board.number_of_column - 1{
                if board.boxes[raw][column] == player{
                    if column+3 <= board.number_of_column - 2{
                        if column > 0{
                            if board.isEmpty(board.boxes[raw][column-1]) && board.boxes[raw][column+1] == player && board.boxes[raw][column+2] == player{
                                if raw == board.number_of_raw - 1{
                                    position_to_play = column - 1
                                    return true
                                }else{
                                    if board.isEmpty(board.boxes[raw+1][column-1]) == false{
                                        position_to_play = column - 1
                                        return true
                                    }
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw][column+1]) && board.boxes[raw][column+2] == player && board.boxes[raw][column+3] == player{
                            if raw == board.number_of_raw - 1{
                                position_to_play = column + 1
                                return true
                            }
                            else{
                                if board.isEmpty(board.boxes[raw+1][column+1]) == false{
                                    position_to_play = column + 1
                                    return true
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw][column+2]) && board.boxes[raw][column+1] == player && board.boxes[raw][column+3] == player{
                            if raw == board.number_of_raw - 1{
                                position_to_play = column + 2
                                return true
                            }
                            else{
                                if board.isEmpty(board.boxes[raw+1][column+2]) == false{
                                    position_to_play = column + 2
                                    return true
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw][column+3]) && board.boxes[raw][column+1] == player && board.boxes[raw][column+2] == player{
                            if raw == board.number_of_raw - 1{
                                position_to_play = column + 3
                                return true
                                
                            }else{
                                if board.isEmpty(board.boxes[raw+1][column+3]) == false{
                                    position_to_play = column + 3
                                    return true
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        return false
    }
    
    
    func can_win_on_diagonal(player:Int, board:Board) -> Bool{
        for raw in 0...board.number_of_raw - 1{
            for column in 0...board.number_of_column - 1{
                if board.boxes[raw][column] == player{
                    //diagonal de gauche à droite
                    if column+3 <= board.number_of_column - 2 && raw+3 <= board.number_of_raw-4{
                        if column > 0 && raw > 0{
                            if board.isEmpty(board.boxes[raw-1][column-1]) && board.boxes[raw+1][column+1] == player && board.boxes[raw+2][column+2] == player{
                                if board.isEmpty(board.boxes[raw][column-1]) == false{
                                    position_to_play = column - 1
                                    return true
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw+1][column+1]) && board.boxes[raw+2][column+2] == player && board.boxes[raw+3][column+3] == player{
                            if board.isEmpty(board.boxes[raw+2][column+1]) == false{
                                position_to_play = column + 1
                                return true
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw+2][column+2]) && board.boxes[raw+1][column+1] == player && board.boxes[raw+3][column+3] == player{
                            if board.isEmpty(board.boxes[raw+3][column+2]) == false{
                                position_to_play = column + 2
                                return true
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw+3][column+3]) && board.boxes[raw+1][column+1] == player && board.boxes[raw+2][column+2] == player{

                            if board.isEmpty(board.boxes[raw+4][column+3]) == false{
                                position_to_play = column + 3
                                return true
                            }
                        }
                    }
                    
                    //diagonal de droite a gauche
                    if column-3 <= 1 && raw+3 <= board.number_of_raw-4{
                        if column == board.number_of_column - 2 && raw > 0{
                            if board.isEmpty(board.boxes[raw-1][column+1]) && board.boxes[raw+1][column-1] == player && board.boxes[raw+2][column-2] == player{
                                if raw+3 >= board.number_of_raw - 1{
                                    position_to_play = column + 1
                                    return true
                                }else{
                                    if board.isEmpty(board.boxes[raw][column+1]) == false{
                                        position_to_play = column + 1
                                        return true
                                    }
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw+1][column-1]) && board.boxes[raw+2][column-2] == player && board.boxes[raw+3][column-3] == player{
                            if raw+3 >= board.number_of_raw - 1{
                                position_to_play = column - 1
                                return true
                            }
                            else{
                                if board.isEmpty(board.boxes[raw+2][column-1]) == false{
                                    position_to_play = column - 1
                                    return true
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw+2][column-2]) && board.boxes[raw+1][column-1] == player && board.boxes[raw+3][column-3] == player{
                            if raw+3 >= board.number_of_raw - 1{
                                position_to_play = column - 2
                                return true
                            }
                            else{
                                if board.isEmpty(board.boxes[raw+3][column-2]) == false{
                                    position_to_play = column - 2
                                    return true
                                }
                            }
                        }
                        
                        if board.isEmpty(board.boxes[raw+3][column-3]) && board.boxes[raw+1][column-1] == player && board.boxes[raw+2][column-2] == player{
                            if raw+3 >= board.number_of_raw - 1{
                                position_to_play = column - 3
                                return true
                                
                            }else{
                                if board.isEmpty(board.boxes[raw+4][column-3]) == false{
                                    position_to_play = column - 3
                                    return true
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        return false
    }
    
    
}
