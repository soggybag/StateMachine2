//
//  CountDownState.swift
//  StateMachine2
//
//  Created by mitchell hudson on 6/24/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class CountDownState: GKState {
    
    unowned let scene: GameScene
    
    var counter: Int = 0 {
        didSet {
            scene.countDownLabel.text = "\(counter)"
        }
    }
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        // TODO: Show Timer
        counter = 3
        
        scene.countDownLabel.hidden = false
        let wait = SKAction.waitForDuration(1)
        
        let count = SKAction.runBlock {
            self.counter -= 1
        }
        
        let playGame = SKAction.runBlock { 
            self.stateMachine?.enterState(PlayingState)
        }
        let sequence = SKAction.sequence([wait, count, wait, count, wait, count, wait, playGame])
    
        scene.runAction(sequence)
    }
    
    override func willExitWithNextState(nextState: GKState) {
        // TODO: Hide Timer
        scene.countDownLabel.hidden = true
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        //
        return true
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        //
    }
    
}
