//
//  ViewController.swift
//  PuissanceSwift
//
//  Created by Developer on 13/12/2016.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameManager = GameManager()
    
    var p1_image = UIImage(named:"p4_player_1.jpg")
    var p2_image = UIImage(named:"p4_player_2.png")
    var empty_image = UIImage(named:"p4_empty.gif")
    
    @IBOutlet weak var Info: UILabel!
    @IBOutlet weak var new_button: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        new_button.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Jeux de test
    
    @IBAction func test(_ sender: AnyObject) {
        gameManager.test()
    }
    
    /////////////////////////////////

    @IBAction func play(_ sender: UIButton) {
        guard gameManager.board.column_isFull(column: sender.tag) == false else{
            return
        }
        if gameManager.win == 0{
            gameManager.play_turn(column: sender.tag)
            show_board()
            get_turn()
            check_win()
        }else{
            Info.text = "Partie terminé"
            Info.textColor = UIColor.black
        }
    }
    @IBAction func lauch_new(_ sender: UIButton) {
        gameManager.reset_game()
        Info.text = "Le combat est lancé!!!"
        Info.textColor = UIColor.black
        new_button.isHidden = true
        show_board()
    }
    
    func get_turn(){
        if gameManager.turn_of == 1{
            Info.text = "Aux Jedis d'agir!!"
            Info.textColor = UIColor.green
        }
        else{
            Info.text = "Aux Siths d'attaquer..."
            Info.textColor = UIColor.red
        }
    }
    
    func check_win(){
        if gameManager.win != 0 {
            if gameManager.win == 1{
                Info.text = "Les Jedis ont vaincu l'empire!!!"
                Info.textColor = UIColor.green
            }
            else{
                Info.text = "Les Siths ont détruit les jedis..."
                Info.textColor = UIColor.red
            }
            new_button.isHidden = false
        }else if gameManager.board.IsFull() == true{
            Info.text = "Egalité entre les factions"
            Info.textColor = UIColor.black
            new_button.isHidden = false
        }
        
    }
    
    func show_board(){
        let board = gameManager.board
        for raw in 0...board.number_of_raw - 1{
            for column in 0...board.number_of_column - 1{
                for button in get_buttons(){
                    set_image_to_button(button, raw: raw, column: column, board: board)
                }
            }
        }
    }
    
    func set_image_to_button(_ button:UIButton, raw:Int,column:Int, board:Board){
        if button.currentTitle == "\(raw)_\(column)"{
            if board.boxes[raw][column] == 1{
                button.setImage(p1_image, for: .normal)
            }
            else if board.boxes[raw][column] == 2{
                button.setImage(p2_image, for: .normal)
            }
            else{
                button.setImage(empty_image, for: .normal)
            }
        }
    }
    
    func get_buttons() -> Array<UIButton>{
        var buttons = [UIButton]()
        for views in view.subviews {
            if let button = views as? UIButton {
                buttons.append(button)
            }
        }
        return buttons
        
    }

}
