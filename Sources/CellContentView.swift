import SwiftUI

@available(macOS 14, *)
struct CellContentView: View {
    
    var type: ColumnContentType
    var content: String
    var color: Color?
    
    var body: some View {
        Group {
            if (type == .text) {
                Text(content)
                    .lineLimit(1)
                    .truncationMode(.tail)
            } else if (type == .sysemImage) {
                ZStack {
                    Image(systemName: content)
                    Text("e")
                        .opacity(0.001)
                }
            } else if (type == .spacer) {
                Spacer(minLength: 0)
            }
        }
        .conditionalForegroundColor(color: color)
    }
}
