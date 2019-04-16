import SpriteKit

public class FinalScene: SKScene {
    
    weak var tryAgainButton: SKLabelNode!
    
    let decreaseScale = SKAction.scale(to: 0.9, duration: 0)
    let increaseScale = SKAction.scale(to: 1, duration: 0)
    
    let fadeIn = SKAction.fadeIn(withDuration: 1.0)
    
    public override func didMove(to view: SKView) {
        tryAgainButton = childNode(withName: "tryAgainButton") as? SKLabelNode
        
        let scoreAmontLabel = childNode(withName: "scoreAmontLabel") as? SKLabelNode
        let messageLabel = childNode(withName: "messageLabel") as? SKLabelNode
        
        scoreAmontLabel?.text = String(Game.score)
        scoreAmontLabel?.alpha = 0.0
        scoreAmontLabel?.run(fadeIn)
        
        messageLabel?.numberOfLines = 0
        messageLabel?.horizontalAlignmentMode = .center
        messageLabel?.text = Game.finalMessage()
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            if tryAgainButton.contains(location) { tryAgainButton.run(decreaseScale) }
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            if tryAgainButton.contains(location) {
                tryAgainButton.run(increaseScale)
                presentHomeScene()
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            if !tryAgainButton.contains(location) { tryAgainButton.run(increaseScale) }
        }
    }
    
    private func presentHomeScene() {
        Game.resetScore()
        if let view = self.view {
            // Load the SKScene from 'HomeScene.sks'
            if let scene = HomeScene(fileNamed: "HomeScene") {
                // Scale to fit the window in the scene
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
}

