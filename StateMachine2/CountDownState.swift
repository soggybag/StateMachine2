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
  
  init(scene: GameScene) {
    self.scene = scene
  }
  
  override func didEnter(from previousState: GKState?) {
    scene.startCountDown()
  }
  
  override func willExit(to nextState: GKState) {
    scene.hideCountDown()
  }
  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    //
    return true
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    //
  }
  
}
