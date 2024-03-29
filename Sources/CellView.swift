import SwiftUI

@available(macOS 14, *)
struct CellView<T: Identifiable>: View {
    
    let column: ColumnInfo<T>
    let model: T?
    let settings: TableSettings
    
    @State private var hoverState = false
    @State private var clickState = false
    @State private var showPopover = false
    
    var isHeadLine: Bool {
        model == nil
    }
    
    var clickBackgrround: (Bool, Color) {
        (clickState && column.clickColor != nil && !isHeadLine, column.clickColor != nil && !isHeadLine ? column.clickColor!(model!) : .clear)
    }
    
    var hoverBackground: (Bool, Color) {
        (doHover && hoverState && column.hoverColor != nil, isHeadLine || column.hoverColor == nil ? .clear : column.hoverColor!(model!))
    }
    
    var headlineBackground: (Bool, Color) {
        (isHeadLine, column.title.backColor)
    }
    
    var defaultBackground: Color {
        isHeadLine ? .clear : column.color(model!)
    }
    
    var doHover: Bool {
        !isHeadLine && column.handHover(model!)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            HStack(spacing: 0) {
                if let model = model {
                    ForEach(column.contents.sorted(by: ColumnContentInfo.sorted)) { content in
                        CellContentView(type: content.type, content: content.content(model), color: content.color(model), hoverContent: content.hoverContent?(model), hoverColor: content.hoverColor?(model), isHovered: doHover && hoverState, settings: settings)
                    }
                } else {
                    if (column.title.alighnment == .center || column.title.alighnment == .trailing) {
                        Spacer(minLength: 0)
                    }
                    if let titleSystemImage = column.title.systemImage {
                        CellContentView(type: .sysemImage, content: titleSystemImage, color: column.title.textColor, hoverContent: nil, hoverColor: nil, isHovered: false, settings: settings)
                    }
                    if let titleText = column.title.text {
                        CellContentView(type: .text, content: titleText, color: column.title.textColor, hoverContent: nil, hoverColor: nil, isHovered: false, settings: settings)
                    }
                    if (column.title.alighnment == .center || column.title.alighnment == .leading) {
                        Spacer(minLength: 0)
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .simplePadding()
        .conditionalFrame(width: column.width)
        .conditionalHandHover(show: doHover, isHovering: $hoverState)
        .conditionalBackground(values: [headlineBackground, clickBackgrround, hoverBackground], defaultColor: defaultBackground)
        .conditionalOnTapGesture(show: model != nil && (column.clickAction != nil || column.popover != nil), action: clickAction)
        .onChange(of: clickState) { oldValue, newValue in
            if (newValue) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    clickState = false
                }
            }
        }
        .popover(isPresented: $showPopover, content: {
            if let popover = column.popover {
                if let model = model {
                    VStack {
                        ForEach(popover.verticalActions.sorted(by: { $0.key < $1.key }).map({ $0 }), id:\.key) { key, action in
                            if (popover.showInactiveActions || action.isActive(model)) {
                                Button {
                                    action.action(model)
                                    showPopover = false
                                } label: {
                                    Text(action.name)
                                        .conditionalFrame(width: popover.minActionWidth)
                                        .conditionalForegroundColor(color: action.color(model))
                                }
                                .disabled(!action.isActive(model))
                            }
                        }
                    }
                    .simplePadding()
                }
            }
        })
    }
    
    func clickAction() {
        clickState = true
        if (column.clickAction != nil && model != nil) {
            column.clickAction!(model!)
        }
        if (column.popover != nil) {
            showPopover = true
        }
    }
}
