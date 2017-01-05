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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        gameManager.play_turn(column: sender.tag)
        let player = gameManager.board.last_box_played["player"]
        if  player == 1{
            sender.setImage(p1_image, for: .normal)
        }
        else if player == 2{
            sender.setImage(p2_image, for: .normal)
        }
        
        
    }

}
