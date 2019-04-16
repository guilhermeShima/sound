import SpriteKit


public class TwinkleScene: SKScene {
    
    //Song mapped to use the game Syllable
    let music: [Syllable] = [
        SongSyllable(note: .c, text: "\"twin\"", waitingTime: 3),
        SongSyllable(note: .c, text: "\"kle\"", waitingTime: 3),
        SongSyllable(note: .g, text: "\"twin\"", waitingTime: 3),
        SongSyllable(note: .g, text: "\"kle\"", waitingTime: 4),
        SongSyllable(note: .a, text: "\"lit\"", waitingTime: 3),
        BlankSyllable(note: .a, text: "\"tle\""),
        SongSyllable(note: .g, text: "\"star\"", waitingTime: 4),
        SongSyllable(note: .f, text: "\"how\"", waitingTime: 3),
        BlankSyllable(note: .f, text: "\"I\""),
        SongSyllable(note: .e, text: "\"won\"", waitingTime: 3),
        SongSyllable(note: .e, text: "\"der\"", waitingTime: 3),
        BlankSyllable(note: .d, text: "\"what\""),
        SongSyllable(note: .d, text: "\"you\"", waitingTime: 3),
        SongSyllable(note: .c, text: "\"are\"", waitingTime: 3),
        BlankSyllable(note: .g, text: "\"up\""),
        SongSyllable(note: .g, text: "\"abo\"", waitingTime: 3),
        BlankSyllable(note: .f, text: "\"ve\""),
        SongSyllable(note: .f, text: "\"the\"", waitingTime: 3),
        SongSyllable(note: .e, text: "\"world\"", waitingTime: 3),
        BlankSyllable(note: .e, text: "\"so\""),
        SongSyllable(note: .d, text: "\"high\"", waitingTime: 3),
        SongSyllable(note: .g, text: "\"like\"", waitingTime: 3),
        BlankSyllable(note: .g, text: "\"a\""),
        SongSyllable(note: .f, text: "\"dia\"", waitingTime: 3),
        SongSyllable(note: .f, text: "\"mond\"", waitingTime: 3),
        SongSyllable(note: .e, text: "\"in\"", waitingTime: 3),
        BlankSyllable(note: .e, text: "\"the\""),
        SongSyllable(note: .d, text: "\"sky\"", waitingTime: 3),
        BlankSyllable(note: .c, text: "\"twin\""),
        SongSyllable(note: .c, text: "\"kle\"", waitingTime: 3),
        BlankSyllable(note: .g, text: "\"twin\""),
        SongSyllable(note: .g, text: "\"kle\"", waitingTime: 4),
        BlankSyllable(note: .a, text: "\"lit\""),
        SongSyllable(note: .a, text: "\"tle\"", waitingTime: 4),
        SongSyllable(note: .g, text: "\"star\"", waitingTime: 4),
        BlankSyllable(note: .f, text: "\"how\""),
        SongSyllable(note: .f, text: "\"I\"", waitingTime: 3),
        SongSyllable(note: .e, text: "\"won\"", waitingTime: 3),
        BlankSyllable(note: .e, text: "\"der\""),
        BlankSyllable(note: .d, text: "\"what\""),
        SongSyllable(note: .d, text: "\"you\"", waitingTime: 3),
        BlankSyllable(note: .c, text: "\"are.\"")
    ]
    
    var currentSyllable: Syllable?
    var currentIndex: Int = 0
    var isBlankSyllable: Bool = false
    
    weak var solfegeSprite: SKSpriteNode!
    weak var noteButton: SKSpriteNode!
    weak var textLabel: SKLabelNode!
    weak var firstOptionLabel: SKLabelNode!
    weak var secondOptionLabel: SKLabelNode!
    weak var thirdOptionLabel: SKLabelNode!
    weak var scorePointsLabel: SKLabelNode!
    weak var quitButton: SKLabelNode!
    weak var yourTurnLabel: SKLabelNode!
    
    let fadeIn = SKAction.fadeIn(withDuration: 1.0)
    let fadeOut = SKAction.fadeOut(withDuration: 0.1)
    
    let decreaseScale = SKAction.scale(to: 0.9, duration: 0)
    let increaseScale = SKAction.scale(to: 1, duration: 0)
    
    let buttonLeft = SKAction.rotate(byAngle: 0.1, duration: 0.1)
    let buttonRight = SKAction.rotate(byAngle: -0.1, duration: 0.1)
    
    public override func didMove(to view: SKView) {
        noteButton = childNode(withName: "noteButton") as? SKSpriteNode
        solfegeSprite = noteButton.childNode(withName: "solfegeSprite") as? SKSpriteNode
        textLabel = childNode(withName: "textLabel") as? SKLabelNode
        firstOptionLabel = childNode(withName: "firstOptionLabel") as? SKLabelNode
        secondOptionLabel = childNode(withName: "secondOptionLabel") as? SKLabelNode
        thirdOptionLabel = childNode(withName: "thirdOptionLabel") as? SKLabelNode
        scorePointsLabel = childNode(withName: "scorePointsLabel") as? SKLabelNode
        quitButton = childNode(withName: "quitButton") as? SKLabelNode
        yourTurnLabel = childNode(withName: "yourTurnLabel") as? SKLabelNode
        
        //Starting the game
        playNote()
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    private func goToHome() {
        if let view = self.view {
            // Load the SKScene from 'HomeScene.sks'
            if let scene = HomeScene(fileNamed: "HomeScene") {
                // Scale to fit the window in the scene
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            //Setting user interaction for blank syllable
            if isBlankSyllable {
                if firstOptionLabel.contains(location) { firstOptionLabel.run(decreaseScale) }
                else if secondOptionLabel.contains(location) { secondOptionLabel.run(decreaseScale) }
                else if thirdOptionLabel.contains(location) { thirdOptionLabel.run(decreaseScale) }
            }
            
            if quitButton.contains(location) { quitButton.run(decreaseScale) }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            //Setting user interaction for blank syllable
            if isBlankSyllable {
                if noteButton.contains(location) { tapNoteButtonAction() }
                else if firstOptionLabel.contains(location) { checkFirstLabel() }
                else if secondOptionLabel.contains(location) { checkSecondLabel() }
                else if thirdOptionLabel.contains(location) { checkThirdLabel() }
            }
            
            if quitButton.contains(location) {
                quitButton.run(increaseScale)
                Game.resetScore()
                goToHome()
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            //Setting user interaction for blank syllable
            if isBlankSyllable {
                if !firstOptionLabel.contains(location) { firstOptionLabel.run(increaseScale) }
                if !secondOptionLabel.contains(location) { secondOptionLabel.run(increaseScale) }
                if !thirdOptionLabel.contains(location) { thirdOptionLabel.run(increaseScale) }
            }
            
            if !quitButton.contains(location) { quitButton.run(increaseScale) }
        }
    }

    //Function to play current syllable note
    private func tapNoteButtonAction() {
        guard let soundNote = currentSyllable?.note.soundAction() else { return }
        run(soundNote)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        noteButton.run(sequence)
    }
    
    //Function to check the tap in first label
    private func checkFirstLabel() {
        firstOptionLabel.run(increaseScale)
        
        if firstOptionLabel.text == currentSyllable?.note.rawValue {
            updateScoreLabel()
        } else {
            animateScoreLabelForFailure()
        }

        //Showing the next syllable
        currentIndex += 1
        playNote()
    }
    
    //Function to check the tap in second label
    private func checkSecondLabel() {
        secondOptionLabel.run(increaseScale)
        
        if secondOptionLabel.text == currentSyllable?.note.rawValue {
            updateScoreLabel()
        } else {
            animateScoreLabelForFailure()
        }
        
        
        //Showing the next syllable
        currentIndex += 1
        playNote()
    }
    
    //Function to check the tap in third label
    private func checkThirdLabel() {
        thirdOptionLabel.run(increaseScale)
        
        if thirdOptionLabel.text == currentSyllable?.note.rawValue {
            updateScoreLabel()
        } else {
          animateScoreLabelForFailure()
        }
        
        //Showing the next syllable
        currentIndex += 1
        playNote()
    }
    
    //Add scores and animate it
    private func updateScoreLabel() {
        Game.addScore()
        let scoreFadeIn = SKAction.fadeIn(withDuration: 0.2)
        let scoreFadeOut = SKAction.fadeOut(withDuration: 0.1)
        
        let turnColorGreen = SKAction.customAction(withDuration: 0.5) { node, _ in
            let label = node as! SKLabelNode
            label.fontColor = .green
        }
        
        let turnColorBlack = SKAction.customAction(withDuration: 0.5) { node, _ in
            let label = node as! SKLabelNode
            label.fontColor = .black
        }

        let sequence = SKAction.sequence([scoreFadeOut, turnColorGreen, scoreFadeIn, turnColorBlack])
        scorePointsLabel.text = String(Game.score)
        scorePointsLabel.run(sequence)
    }
    
    //Animate scores for failure
    private func animateScoreLabelForFailure() {
        let scoreFadeIn = SKAction.fadeIn(withDuration: 0.2)
        let scoreFadeOut = SKAction.fadeOut(withDuration: 0.1)
        
        let turnColorRed = SKAction.customAction(withDuration: 0.5) { node, _ in
            let label = node as! SKLabelNode
            label.fontColor = .red
        }
        
        let turnColorBlack = SKAction.customAction(withDuration: 0.5) { node, _ in
            let label = node as! SKLabelNode
            label.fontColor = .black
        }
        
        let sequence = SKAction.sequence([scoreFadeOut, turnColorRed, scoreFadeIn, turnColorBlack])
        scorePointsLabel.run(sequence)
    }
    
    //Recursive function to play the music syllables
    private func playNote() {
        //Presenting final scene after the game is over
        if currentIndex == music.count {
            presentFinalScene()
            return
        }
        
        currentSyllable = music[currentIndex]
        let soundNote = music[currentIndex].note.soundAction()
        
        configureSceneForNote()
        
        if let songSyllable = currentSyllable as? SongSyllable {
            //Game settings for song syllable
            isBlankSyllable = false
            configureSceneForSongSyllable()
            
            //The scene should play the note and wait to go to the next
            let wait = SKAction.wait(forDuration: songSyllable.waitingTime)
            run(soundNote) {
                self.run(wait)
                self.currentIndex += 1
                self.playNote()
            }
        } else {
            //Game settings for blank syllable
            isBlankSyllable = true
            configureSceneForBlankSyllable()
            run(soundNote)
        }
    }
    
    private func configureSceneForBlankSyllable() {
        //At this point it will always have a value to current syllable
        guard let note = currentSyllable?.note else { return }
        
        //Generating random note options
        var randomNote: String = ""
        var secondRandomNote: String = ""
        
        repeat {
            randomNote = music.randomElement()?.note.rawValue ?? ""
        } while randomNote == ""
            || randomNote == note.rawValue
        
        repeat {
            secondRandomNote = music.randomElement()?.note.rawValue ?? ""
        } while secondRandomNote == ""
            || secondRandomNote == note.rawValue
            || secondRandomNote == randomNote
        
        //Generating random position to right note
        let randomPosition = Int.random(in: 0...2)
        
        if randomPosition == 0 {
            firstOptionLabel.text = note.rawValue
            secondOptionLabel.text = randomNote
            thirdOptionLabel.text = secondRandomNote
        } else if randomPosition == 1 {
            firstOptionLabel.text = randomNote
            secondOptionLabel.text = note.rawValue
            thirdOptionLabel.text = secondRandomNote
        } else {
            firstOptionLabel.text = randomNote
            secondOptionLabel.text = secondRandomNote
            thirdOptionLabel.text = note.rawValue
        }
        
        //Setting label animation, they all should fade in
        firstOptionLabel.alpha = 0
        secondOptionLabel.alpha = 0
        thirdOptionLabel.alpha = 0
        
        let blankFadeIn = SKAction.fadeIn(withDuration: 0.1)
        
        firstOptionLabel.run(blankFadeIn)
        secondOptionLabel.run(blankFadeIn)
        thirdOptionLabel.run(blankFadeIn)
        yourTurnLabel.run(blankFadeIn)
    }
    
    private func configureSceneForSongSyllable() {
        //At this point it will always have a value to current syllable
        guard let note = self.currentSyllable?.note else { return }
        
        secondOptionLabel.text = note.rawValue
        secondOptionLabel.alpha = 0
        
        //The second label should fade in
        secondOptionLabel.run(fadeIn)
    }
    
    //Default scene configuration
    private func configureSceneForNote() {
        guard let note = self.currentSyllable?.note else { return }
        
        solfegeSprite.texture = note.imageTexture()
        solfegeSprite.alpha = 0
        
        noteButton.color = note.color()
        noteButton.alpha = 0
        
        textLabel.text = currentSyllable?.text
        textLabel.alpha = 0
        
        solfegeSprite.run(fadeIn)
        noteButton.run(fadeIn)
        textLabel.run(fadeIn)
        
        let sequence = SKAction.sequence([buttonLeft, buttonRight, buttonRight, buttonLeft])
        noteButton.run(sequence)
        
        thirdOptionLabel.run(fadeOut)
        firstOptionLabel.run(fadeOut)
        yourTurnLabel.run(fadeOut)
    }
    
    private func presentFinalScene() {
        if let view = self.view {
            // Load the SKScene from 'FinalScene.sks'
            if let scene = FinalScene(fileNamed: "FinalScene") {
                // Scale to fit the window in the scene
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
}
