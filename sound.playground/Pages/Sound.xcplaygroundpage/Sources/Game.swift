
public class Game {
    public static var score: Int = 0
    
    public static func addScore() {
        score += 10
    }
    
    public static func resetScore() {
        score = 0
    }
    
    public static func finalMessage() -> String {
        
        if score == 150 {
            return "Well, the cake was a lie! Great job!\nAnd as always stay hungry stay foolish."
        }
        
        if score <= 50 {
            return "Well played! You're starting to get it\nBut can you score 100 points next time?"
        } else if score < 150 {
            return "Oh, you are becoming a pro! Nice job!\nBut can you score 150? (There's a cake)"
        }
        return ""
    }
}
