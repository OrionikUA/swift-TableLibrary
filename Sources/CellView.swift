import SwiftUI

@available(macOS 14, *)
struct CellView<T: Identifiable>: View {
    
    let column: ColumnInfo<T>
    let model: T?
    
    @State private var hoverState = false
    
    var isHeadLine: Bool {
        model == nil
    }
    
    var hoverBackground: (Bool, Color) {
        (!isHeadLine && column.handHover(model!) && hoverState && column.hoverColor != nil, isHeadLine || column.hoverColor == nil ? .clear : column.hoverColor!(model!))
    }
    
    var headlineBackground: (Bool, Color) {
        (isHeadLine, column.titleContentBackColor)
    }
    
    var defaultBackground: Color {
        isHeadLine ? .clear : column.color(model!)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            if let model = model {
                ForEach(column.contents.sorted(by: ColumnContentInfo.sorted)) { content in
                    CellContentView(type: content.type, content: content.content(model), color: content.color(model))
                }
            } else {
                if (column.titleAlighnment == .center || column.titleAlighnment == .trailing) {
                    Spacer(minLength: 0)
                }
                CellContentView(type: column.titleContentType, content: column.titleContent, color: column.titleContentColor)
                if (column.titleAlighnment == .center || column.titleAlighnment == .leading) {
                    Spacer(minLength: 0)
                }
            }
        }
        .simplePadding()
        .conditionalFrame(width: column.width)
        .conditionalHandHover(show: !isHeadLine && column.handHover(model!), isHovering: $hoverState)
        .conditionalBackground(values: [headlineBackground, hoverBackground], defaultColor: defaultBackground)
        .conditionalOnTapGesture(show: model != nil && column.clickAction != nil, action: { column.clickAction!(model!) })
    }
}
