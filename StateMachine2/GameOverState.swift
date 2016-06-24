//
//  Ready.swift
//  StateMachine2
//
//  Created by mitchell hudson on 6/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import GameplayKit
import SpriteKit

class GameOverState: GKState {
    
    unowned let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        print("Game Over state entered from state: \(previousState)")
        scene.currentStateLabel.text = "Game Over"
        
        // When we enter the game over state the game sprite will spin
        let rotateAction = SKAction.repeatActionForever(SKAction.rotateByAngle(1.0, duration: 1))
        scene.gameSprite.runAction(rotateAction)
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return true
    }
    
    override func willExitWithNextState(nextState: GKState) {
        // After we exit this state the game sprite should stop spinning and reset 
        scene.gameSprite.removeAllActions()
        scene.gameSprite.zRotation = 0
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        print("Game over State update")
    }
}
