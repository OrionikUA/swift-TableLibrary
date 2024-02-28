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
    
    func conditionalForegroundColor(show: Bool, color: Color) -> some View {
        if (show) {
            return AnyView(self.foregroundStyle(color))
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
    
    func conditionalBackground(show: Bool, color: Color) -> some View {
        if (show) {
            return AnyView(self.background(color))
        } else {
            return AnyView(self)
        }
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
    
    func conditionalMultiLine(_ add: Bool) -> some View {
        if (add) {
            return AnyView(self)
        } else {
            return AnyView(self.lineLimit(1).truncationMode(.tail))
        }
    }
    
    func conditionalDraggable<T: IdentifiableAndTransferable, Content1: View>(_ add: Bool, item: T, @ViewBuilder navigationView: () -> Content1) -> some View {
        if (add) {
            return AnyView(self.draggable(item.id) {
                navigationView()
            })
        } else {
            return AnyView(self)
        }
    }
    
    func conditionalDropDestination<T: IdentifiableAndTransferable>(_ add: Bool, item: T, action: @escaping (_ items: [T.ID], _ location: CGPoint) -> Bool, isTargeted: @escaping (Bool) -> Void = { _ in }) -> some View {
        if (add) {
            return AnyView(self.dropDestination(for: T.ID.self, action: action))
        } else {
            return AnyView(self)
        }
    }
}
