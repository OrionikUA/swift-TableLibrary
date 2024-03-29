import SwiftUI

@available(macOS 14, *)
struct CellContentView: View {
    
    
    
    let type: ColumnContentType
    let content: String
    let color: Color?
    let hoverContent: String?
    let hoverColor: Color?
    let isHovered: Bool
    let settings: TableSettings
    
    var calcContent: String {
        if (isHovered && hoverContent != nil) {
            return hoverContent!
        }
        return content
    }
    
    var calcColor: Color? {
        if (isHovered && hoverColor != nil) {
            return hoverColor!
        }
        return color
    }
    
    var body: some View {
        Group {
            if (type == .text) {
                Text(calcContent)
                    .conditionalMultiLine(settings.multiLine)
            } else if (type == .sysemImage) {
                Image(systemName: calcContent)
            } else if (type == .spacer) {
                Spacer(minLength: 0)
            } else if case let .space(width) = type {
                Color.clear.frame(width: width)
            }
        }
        .conditionalForegroundColor(color: calcColor)
    }
}
