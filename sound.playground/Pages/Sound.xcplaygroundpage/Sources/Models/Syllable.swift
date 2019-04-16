import UIKit
import SpriteKit

public enum MusicalNote: String {
    case c = "Do"
    case d = "Re"
    case e = "Mi"
    case f = "Fa"
    case g = "Sol"
    case a = "La"
    case b = "Ti"
    
    func color() -> UIColor {
        switch self {
        case .c: return UIColor.cLime
        case .d: return UIColor.dSkyBlue
        case .e: return UIColor.eBlue
        case .f: return UIColor.fIndigo
        case .g: return UIColor.gRed
        case .a: return UIColor.aOrange
        case .b: return UIColor.bChartreuse
        }
    }
    
    func soundAction() -> SKAction {
        switch self {
        case .c: return GameSound.cAction
        case .d: return GameSound.dAction
        case .e: return GameSound.eAction
        case .f: return GameSound.fAction
        case .g: return GameSound.gAction
        case .a: return GameSound.aAction
        case .b: return GameSound.bAction
        }
    }
    
    func imageTexture() -> SKTexture {
        switch self {
        case .c: return GameImage.cImage
        case .d: return GameImage.dImage
        case .e: return GameImage.eImage
        case .f: return GameImage.fImage
        case .g: return GameImage.gImage
        case .a: return GameImage.aImage
        case .b: return GameImage.bImage
        }
    }
}

protocol Syllable {
    var note: MusicalNote { get }
    var text: String { get }
}

//Syllable that will be automatically played
public struct SongSyllable: Syllable {
    private(set) var note: MusicalNote
    private(set) var text: String
    var waitingTime: TimeInterval
}

//Syllable that the player will need to guess
public struct BlankSyllable: Syllable {
    private(set) var note: MusicalNote
    private(set) var text: String
}
