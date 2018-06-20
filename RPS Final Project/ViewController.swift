//
//  ViewController.swift
//  RPS Final Project
//
//  Created by Rabia Mohiuddin on 6/18/18.
//  Copyright © 2018 Rabia Mohiuddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(.start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockClicked(_ sender: Any) {
        play(sign: .rock)
    }
    @IBAction func paperClicked(_ sender: Any) {
        play(sign: .paper)
    }
    @IBAction func scissorsClicked(_ sender: Any) {
        play(sign: .scissors)
    }
    @IBAction func playAgainClicked(_ sender: Any) {
        updateUI(.start)
    }
    
    func updateUI(_ state: GameState) {
        var text: String {
            switch state {
                case .start:
                    return "Rock, Paper, Scissors?"
                case .win:
                    return "You Win!"
                case .lose:
                    return "You Lost!"
                case .draw:
                    return "Draw!"
            }
        }
        gameStatus.text = text
        
        switch state {
            case .start:
                view.backgroundColor = UIColor.white
                appSign.text = "🙈"
                playAgainButton.isHidden = true
                rockButton.isEnabled = true
                paperButton.isEnabled = true
                scissorsButton.isEnabled = true
                rockButton.isHidden = false
                paperButton.isHidden = false
                scissorsButton.isHidden = false
            case .win:
                view.backgroundColor = UIColor(red:0.63, green:1.00, blue:0.68, alpha:1.0)
            case .lose:
                view.backgroundColor = UIColor(red:1.00, green:0.45, blue:0.45, alpha:1.0)
            case .draw:
                view.backgroundColor = UIColor(red:0.73, green:0.73, blue:1.00, alpha:1.0)
        }
        
    }
    
    func play(sign: Sign) {
        let random = randomSign()
        updateUI(sign.beats(random))
        appSign.text = random.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        switch sign {
            case .rock:
                rockButton.isEnabled = true
                rockButton.isHidden = false
            case .paper:
                paperButton.isEnabled = true
                paperButton.isHidden = false
            case .scissors:
                scissorsButton.isEnabled = true
                scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
}

