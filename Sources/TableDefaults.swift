import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableDefaults {
    public let color: Color
    public let width: CGFloat?
    public let hoverColor: Color?
    public let handHover: Bool
    public let clickColor: Color
    public let columnContentColor: Color
    public let columnContent: String
    public let columnContentSpace: CGFloat
    public let titleTextColor: Color
    public let titleBackColor: Color
    public let titleAlighnment: HorizontalAlignment
    
    public init(color: Color, width: CGFloat?, hoverColor: Color?, handHover: Bool, clickColor: Color, columnContentColor: Color, columnContent: String, columnContentSpace: CGFloat, titleTextColor: Color, titleBackColor: Color, titleAlighnment: HorizontalAlignment) {
        self.color = color
        self.width = width
        self.hoverColor = hoverColor
        self.handHover = handHover
        self.clickColor = clickColor
        self.columnContentColor = columnContentColor
        self.columnContent = columnContent
        self.columnContentSpace = columnContentSpace
        self.titleTextColor = titleTextColor
        self.titleBackColor = titleBackColor
        self.titleAlighnment = titleAlighnment
    }
}
