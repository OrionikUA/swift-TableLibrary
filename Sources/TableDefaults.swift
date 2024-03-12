import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableDefaults {
    let columnContentColor: Color
    let columnContent: String
    let titleTextColor: Color
    let titleBackColor: Color
    let titleAlighnment: HorizontalAlignment
    
    public init(columnContentColor: Color, columnContent: String, titleTextColor: Color, titleBackColor: Color, titleAlighnment: HorizontalAlignment) {
        self.columnContentColor = columnContentColor
        self.columnContent = columnContent
        self.titleTextColor = titleTextColor
        self.titleBackColor = titleBackColor
        self.titleAlighnment = titleAlighnment
    }
}
