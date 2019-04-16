import SpriteKit

public class HomeScene: SKScene {
    
    weak var startButton: SKSpriteNode!
    weak var cButton: SKSpriteNode!
    weak var dButton: SKSpriteNode!
    weak var eButton: SKSpriteNode!
    weak var fButton: SKSpriteNode!
    weak var gButton: SKSpriteNode!
    weak var aButton: SKSpriteNode!
    weak var bButton: SKSpriteNode!
    
    let decreaseScale = SKAction.scale(to: 0.9, duration: 0)
    let increaseScale = SKAction.scale(to: 1, duration: 0)
    
    let buttonLeft = SKAction.rotate(byAngle: 0.1, duration: 0.1)
    let buttonRight = SKAction.rotate(byAngle: -0.1, duration: 0.1)
    
    public override func didMove(to view: SKView) {
        //Adding fade in animation to title
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        let titleLabel = childNode(withName: "titleLabel") as! SKLabelNode
        titleLabel.alpha = 0.0
        titleLabel.run(fadeIn)
        
        startButton = childNode(withName: "startButton") as? SKSpriteNode
        cButton = childNode(withName: "cButton") as? SKSpriteNode
        dButton = childNode(withName: "dButton") as? SKSpriteNode
        eButton = childNode(withName: "eButton") as? SKSpriteNode
        fButton = childNode(withName: "fButton") as? SKSpriteNode
        gButton = childNode(withName: "gButton") as? SKSpriteNode
        aButton = childNode(withName: "aButton") as? SKSpriteNode
        bButton = childNode(withName: "bButton") as? SKSpriteNode
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    private func startGame() {
        if let view = self.view {
            // Load the SKScene from 'GameScene.sks'
            if let scene = TwinkleScene(fileNamed: "GameScene") {
                // Scale to fit the window in the scene
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    
    private func cButtonAction() {
        let soundAction = MusicalNote.c.soundAction()
        cButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        cButton.run(sequence)
    }
    
    private func dButtonAction() {
        let soundAction = MusicalNote.d.soundAction()
        dButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        dButton.run(sequence)
    }
    
    private func eButtonAction() {
        let soundAction = MusicalNote.e.soundAction()
        eButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        eButton.run(sequence)
    }
    
    private func fButtonAction() {
        let soundAction = MusicalNote.f.soundAction()
        fButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        fButton.run(sequence)
    }
    
    private func gButtonAction() {
        let soundAction = MusicalNote.g.soundAction()
        gButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        gButton.run(sequence)
    }
    
    private func aButtonAction() {
        let soundAction = MusicalNote.a.soundAction()
        aButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        aButton.run(sequence)
    }
    
    private func bButtonAction() {
        let soundAction = MusicalNote.b.soundAction()
        bButton.run(soundAction)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        bButton.run(sequence)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            //The hand signal buttons will shake and play the sounds
            if startButton.contains(location) { startButton.run(decreaseScale) }
            else if cButton.contains(location) { cButtonAction() }
            else if dButton.contains(location) { dButtonAction() }
            else if eButton.contains(location) { eButtonAction() }
            else if fButton.contains(location) { fButtonAction() }
            else if gButton.contains(location) { gButtonAction() }
            else if aButton.contains(location) { aButtonAction() }
            else if bButton.contains(location) { bButtonAction() }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            if startButton.contains(location) {
                startButton.run(increaseScale)
                startGame()
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            if !startButton.contains(location) {
                startButton.run(increaseScale)
            }
        }
    }
}
