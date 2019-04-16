import PlaygroundSupport
import SpriteKit

public class Home {
    
    public static func presentScene() {
        // Load the SKScene from 'HomeScene.sks'
        let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
        if let scene = HomeScene(fileNamed: "HomeScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            sceneView.presentScene(scene)
        }
        
        PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
    }
}
