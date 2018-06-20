//
//  Sign.swift
//  RPS Final Project
//
//  Created by Rabia Mohiuddin on 6/18/18.
//  Copyright © 2018 Rabia Mohiuddin. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    // Return emoji based on enum case
    var emoji: String {
        switch self {
            case .rock: return "👊🏼"
            case .paper: return "✋🏼"
            case .scissors: return "✌🏼"
        }
    }
    
    // function to compare signs and determine winner
    func beats(_ opponentsSign: Sign) -> GameState {
        // switch based on self sign
        switch self {
            case .rock:
                switch opponentsSign {
                    case .rock: return .draw
                    case .paper: return .lose
                    case .scissors: return .win
                }
            case .paper:
                switch opponentsSign {
                    case .rock: return .win
                    case .paper: return .draw
                    case .scissors: return .lose
                }
            case .scissors:
                switch opponentsSign {
                    case .rock: return .lose
                    case .paper: return .win
                    case .scissors: return .draw
                }
            }
    }
}
