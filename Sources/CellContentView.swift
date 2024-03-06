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
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    Image(systemName: content)
                    Text("e")
                        .opacity(0.001)
                    Spacer(minLength: 0)
                }
            } else if (type == .spacer) {
                Spacer(minLength: 0)
            }
        }
        .conditionalForegroundColor(color: color)
    }
}
