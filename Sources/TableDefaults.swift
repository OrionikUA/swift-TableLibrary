import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableDefaults {
    let color: Color
    let width: CGFloat?
    let hoverColor: Color?
    let handHover: Bool
    let clickColor: Color
    let columnContentColor: Color
    let columnContent: String
    let titleTextColor: Color
    let titleBackColor: Color
    let titleAlighnment: HorizontalAlignment
    
    init(color: Color, width: CGFloat?, hoverColor: Color?, handHover: Bool, clickColor: Color, columnContentColor: Color, columnContent: String, titleTextColor: Color, titleBackColor: Color, titleAlighnment: HorizontalAlignment) {
        self.color = color
        self.width = width
        self.hoverColor = hoverColor
        self.handHover = handHover
        self.clickColor = clickColor
        self.columnContentColor = columnContentColor
        self.columnContent = columnContent
        self.titleTextColor = titleTextColor
        self.titleBackColor = titleBackColor
        self.titleAlighnment = titleAlighnment
    }
}
