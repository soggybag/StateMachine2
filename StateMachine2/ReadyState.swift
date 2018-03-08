//
//  Ready.swift
//  StateMachine2
//
//  Created by mitchell hudson on 6/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//


// GKState is an abstract class. You need to sub class it. 
// This class represents the ready state. Imagine in this 
// state the game will

import GameplayKit
import SpriteKit

class ReadyState: GKState {
  
  // This state will need a reference to the scene.
  unowned let scene: GameScene
  
  // Get the scene in the initializer
  init(scene: GameScene) {
    self.scene = scene
  }
  
  // This method is called when the state machine enters this state
  override func didEnter(from previousState: GKState?) {
    print("Ready state entered from state: \(previousState)")
    // When entering this state we'll do a few things.
    scene.currentStateLabel.text = "Ready"  // Show the state in the label
    scene.gameSprite.position.x = 0         // Reset the position of the game sprite
  }
  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    return true
  }
  
  override func willExit(to nextState: GKState) {
    
    print("Will Exit Ready State")
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    // print("Ready State update")
    
  }
}
