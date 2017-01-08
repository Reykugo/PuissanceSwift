//
//  OptionViewController.swift
//  PuissanceSwift
//
//  Created by Developer on 07/01/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController {
    
    var gameManager = GameManager()
    
    
    @IBOutlet weak var play_with_player: UISwitch!
    @IBOutlet weak var play_with_ai: UISwitch!
    
    @IBOutlet weak var levels: UIView!
    
    @IBOutlet weak var level_one: UISwitch!
    @IBOutlet weak var level_two: UISwitch!
    @IBOutlet weak var level_three: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.gif")!)
        levels.backgroundColor = UIColor(patternImage: UIImage(named: "background.gif")!)
        configure_view()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configure_view(){
        if gameManager.play_with_ai == true{
            play_with_player.isOn = false
            play_with_ai.isOn = true
            levels.isHidden = false
            configure_levels()
        }else{
            play_with_player.isOn = true
            play_with_ai.isOn = false
            levels.isHidden = true
        }
    }
    
    func configure_levels(){
        if gameManager.player2.level == 1 {
            level_one.isOn = true
            level_two.isOn = false
            level_three.isOn = false
        }
        else if gameManager.player2.level == 2{
            level_one.isOn = false
            level_two.isOn = true
            level_three.isOn = false
        }else{
            level_one.isOn = false
            level_two.isOn = false
            level_three.isOn = true
        }
    }
    
    
    @IBAction func change_level(_ sender: UISwitch) {
        gameManager.player2.level = sender.tag
        gameManager.player2.get_scales_by_level()
        configure_levels()
    }
    
    
    @IBAction func play_with(_ sender: UISwitch) {
        if sender.tag == 1{
            gameManager.play_with_ai = true
        }else{
            gameManager.play_with_ai = false
        }
        configure_view()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
