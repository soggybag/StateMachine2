//
//  GameScene.swift
//  StateMachine2
//
//  Created by mitchell hudson on 6/20/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//



// This example covers basic concepts of GKStateMachine




import SpriteKit
import GameplayKit  // Import GameplayKit


class GameScene: SKScene {
    
    // These labels will act as buttons to change the state
    let readyLabel: SKLabelNode!
    let gameOverLabel: SKLabelNode
    let playGameLabel: SKLabelNode
    
    // Game Sprite. this is a game object
    let gameSprite: SKSpriteNode
    
    // This label will display the current state
    let currentStateLabel: SKLabelNode
    
    // These variables will be used to run the state machine
    var gameState: GKStateMachine!  // This is the state machine
    var readyState: GKState!        // These represent each of the
    var playingState: GKState!      // possible states.
    var gameOverState: GKState!     //
    
    var lastUpdateTime: CFTimeInterval = 0
    
    override init(size: CGSize) {
        // Create labels
        readyLabel = SKLabelNode(fontNamed: "Helvetica")
        gameOverLabel = SKLabelNode(fontNamed: "Helvetica")
        playGameLabel = SKLabelNode(fontNamed: "Helvetica")
        currentStateLabel = SKLabelNode(fontNamed: "Helvetica")
        
        // Create game sprite
        gameSprite = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 40, height: 40))
        gameSprite.name = "gameSprite"
        
        // Configure labels
        readyLabel.text = "- Ready -"
        readyLabel.name = "ready"
        gameOverLabel.text = "- Game Over -"
        gameOverLabel.name = "gameOver"
        playGameLabel.text = "- Play Game -"
        playGameLabel.name = "play"
        
        currentStateLabel.text = "Current State"
        currentStateLabel.horizontalAlignmentMode = .Left
        currentStateLabel.verticalAlignmentMode = .Bottom
        currentStateLabel.fontSize = 24
        currentStateLabel.color = UIColor.redColor()
        
        super.init(size: size)
        
        // GKState is an abstract class you need to sub class it! 
        // Here we make an instance of each of our State classes.
        readyState = ReadyState(scene: self)
        playingState = PlayingState(scene: self)
        gameOverState = GameOverState(scene: self)
        
        // Create an instance of the state machine and provide an array of states.
        gameState = GKStateMachine(states: [readyState, playingState, gameOverState])
        
        // Add the labels to the display hierarchy.
        addChild(readyLabel)
        addChild(gameOverLabel)
        addChild(playGameLabel)
        addChild(currentStateLabel)
        addChild(gameSprite)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Get the center of the screen, use this to position the labels.
        let centerX = view.frame.width / 2
        let centerY = view.frame.height / 2
        
        readyLabel.position.x = centerX
        readyLabel.position.y = centerY / 2
        
        playGameLabel.position.x = centerX
        playGameLabel.position.y = centerY
        
        gameOverLabel.position.x = centerX
        gameOverLabel.position.y = centerY * 1.5
        
        gameSprite.position.y = size.height - 40
        
        // Enter the default state
        gameState.enterState(ReadyState)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        // Check for touches. Touching a label will change the state.
        if let touch = touches.first {
            let location = touch.locationInNode(self)
            let node = nodeAtPoint(location)
            if let name = node.name {
                switch name {
                    case "ready":
                        print("Ready Tapped")
                        gameState.enterState(ReadyState) // Change to Ready State
                    
                    case "gameOver":
                        print("Game Over Tapped")
                        gameState.enterState(GameOverState) // Change to Game Over State
                    
                    case "play":
                        print("Play Tapped")
                        gameState.enterState(PlayingState) // Change to Playing State 
                    
                    case "gameSprite":
                        print("Game Sprite Tapped")
                        // Check the state machine currentState to make descisions.
                        if gameState.currentState is PlayingState {
                            print("Tappng the game sprite in Playing State !!!!")
                        } else {
                            print("Tapping the game sprite in this state has no effect")
                        }
                    
                    default:
                        break
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        let deltaTime = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        gameState.updateWithDeltaTime(deltaTime)
    }
}




