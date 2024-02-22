import SwiftUI
import Foundation

@available(macOS 14, *)
extension View {
    
    func simplePadding() -> some View {
        self.padding(TableUiSettings.simplePadding)
    }
    
    func conditionalFrame(width: CGFloat?) -> some View {
        if let unwrappedWidth = width {
            return AnyView(self.frame(width: unwrappedWidth))
        } else {
            return AnyView(self)
        }
    }
    
    func conditionalForegroundColor(color: Color?) -> some View {
        if let unwrappedColor = color {
            return AnyView(self.foregroundStyle(unwrappedColor))
        } else {
            return AnyView(self)
        }
    }
    
    func conditionalOnTapGesture(show: Bool, action: @escaping () -> Void) -> some View {
        if (show) {
            return AnyView(self.onTapGesture(perform: action))
        } else {
            return AnyView(self)
        }
    }
    
    func conditionalHandHover(show: Bool, isHovering: Binding<Bool>) -> some View {
        return AnyView(self.onHover { hover in
            isHovering.wrappedValue = hover
            if hover && show {
                NSCursor.pointingHand.set()
            } else {
                NSCursor.arrow.set()
            }
        })
    }
    
    func conditionalBackground(values: [(Bool, Color)], defaultColor: Color? = nil) -> some View {
        for value in values {
            if (value.0) {
                return AnyView(self.background(value.1))
            }
        }
        if let color = defaultColor {
            return AnyView(self.background(color))
        }
        return AnyView(self)
    }
}
