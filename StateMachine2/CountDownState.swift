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
  
  override func didEnter(from previousState: GKState?) {
    // TODO: Show Timer
    counter = 3
    
    scene.countDownLabel.isHidden = false
    let wait = SKAction.wait(forDuration: 1)
    
    let count = SKAction.run {
      self.counter -= 1
    }
    
    let playGame = SKAction.run { 
      self.stateMachine?.enter(PlayingState.self)
    }
    let sequence = SKAction.sequence([wait, count, wait, count, wait, count, wait, playGame])
    
    scene.run(sequence)
    
    scene.currentStateLabel.text = "Count Down"
  }
  
  override func willExit(to nextState: GKState) {
    // TODO: Hide Timer
    scene.countDownLabel.isHidden = true
  }
  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    //
    return true
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    //
  }
  
}
