import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableDefaults {
    public let ColumnContentColor: Color
    public let ColumnContent: String
    
    public init(ColumnContentColor: Color, ColumnContent: String) {
        self.ColumnContentColor = ColumnContentColor
        self.ColumnContent = ColumnContent
    }
}
