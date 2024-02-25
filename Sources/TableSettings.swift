import Foundation

public struct TableSettings {
    public let lockHeadLine: Bool
    public let addRightBorder: Bool
    public let addLeftBorder: Bool
    
    public init(lockHeadLine: Bool = false, addRightBorder: Bool = false, addLeftBorder: Bool = false) {
        self.lockHeadLine = lockHeadLine
        self.addRightBorder = addRightBorder
        self.addLeftBorder = addLeftBorder
    }
}
