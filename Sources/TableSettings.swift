import Foundation

public struct TableSettings {
    public let lockHeadLine: Bool
    public let hideHeadLine: Bool
    public let addRightBorder: Bool
    public let addLeftBorder: Bool
    public let addBottomBorder: Bool
    public let addTopBorder: Bool
    public let multiLine: Bool
    
    public init(lockHeadLine: Bool = false, hideHeadLine: Bool = false, addRightBorder: Bool = false, addLeftBorder: Bool = false, addBottomBorder: Bool = false, addTopBorder: Bool = false, multiLine: Bool = false) {
        self.lockHeadLine = lockHeadLine
        self.hideHeadLine = hideHeadLine
        self.addRightBorder = addRightBorder
        self.addLeftBorder = addLeftBorder
        self.multiLine = multiLine
        self.addBottomBorder = addBottomBorder
        self.addTopBorder = addTopBorder
    }
}
