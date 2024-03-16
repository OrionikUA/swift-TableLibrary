import SwiftUI

@available(macOS 14, *)
struct CellContentView: View {
    
    var type: ColumnContentType
    var content: String
    var color: Color?
    let settings: TableSettings
    
    var body: some View {
        Group {
            if (type == .text) {
                Text(content)
                    .conditionalMultiLine(settings.multiLine)
            } else if (type == .sysemImage) {
                Image(systemName: content)
            } else if (type == .spacer) {
                Spacer(minLength: 0)
            } else if case let .space(width) = type {
                Color.clear.frame(width: width)
            }
        }
        .conditionalForegroundColor(color: color)
    }
}
