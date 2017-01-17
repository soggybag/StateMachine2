//
//  Ready.swift
//  StateMachine2
//
//  Created by mitchell hudson on 6/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import GameplayKit
import SpriteKit

class PlayingState: GKState {
    
    unowned let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    override func didEnter(from previousState: GKState?) {
        print("Playing state entered from state: \(previousState)")
        scene.currentStateLabel.text = "Playing"
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }
    
    override func willExit(to nextState: GKState) {
        //
    }
    
    
    // This method is called by the state machine when this is the current state.
    override func update(deltaTime seconds: TimeInterval) {
        // print("Playing State update:\(seconds)")
        
        // In this state we'll update the screen every frame
        let velocity: CGFloat = 40              // Define a velocity
        let dx = velocity * CGFloat(seconds)    // Get distance to move
        scene.gameSprite.position.x += dx       // Move the sprite
        
        // If the sprite gets to the far side of the screen game is over
        if scene.gameSprite.position.x > scene.frame.size.width {
            scene.gameState.enter(GameOverState)   // Enter Game Over state
        }
    }
}
