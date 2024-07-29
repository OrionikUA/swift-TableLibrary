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
    let disableColor: Color?
    let disableContent: String?
    let disable: Bool
    
    init(type: ColumnContentType, content: String, color: Color?, hoverContent: String?, hoverColor: Color?, isHovered: Bool, settings: TableSettings, disableColor: Color?, disableContent: String?, disable: Bool = false) {
        self.type = type
        self.content = content
        self.color = color
        self.hoverContent = hoverContent
        self.hoverColor = hoverColor
        self.isHovered = isHovered
        self.settings = settings
        self.disableColor = disableColor
        self.disableContent = disableContent
        self.disable = disable
    }
    
    var calcContent: String {
        if (disable && disableContent != nil) {
            return disableContent!
        }
        
        if (isHovered && hoverContent != nil) {
            return hoverContent!
        }
        return content
    }
    
    var calcColor: Color? {
        if (disable && disableColor != nil) {
            return disableColor!
        }
        
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
                    .help(calcContent)
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
