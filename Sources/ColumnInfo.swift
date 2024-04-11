import Foundation
import SwiftUI

@available(macOS 14, *)
public struct ColumnInfo<T: Identifiable>: Identifiable {
    public let id: Int
    let contents: [ColumnContentInfo<T>]
    let color: (T) -> Color
    let width: CGFloat?
    let hoverColor: ((T) -> Color)?
    let handHover: (T) -> Bool
    let title: ColumnTitle
    let clickAction: (@MainActor (T) -> Void)?
    let clickColor: ((T) -> Color)?
    let popover: PopoverInfo<T>?
    
    static func sorted(obj1: ColumnInfo<T>, obj2: ColumnInfo<T>) -> Bool {
        return obj1.id < obj2.id
    }
    
    public init(id: Int, contents: [ColumnContentInfo<T>], color: @escaping (T) -> Color, width: CGFloat?, hoverColor: ((T) -> Color)?, handHover: @escaping (T) -> Bool, title: ColumnTitle, popover: PopoverInfo<T>? = nil, clickColor: ((T) -> Color)?, clickAction: (@MainActor (T) -> Void)? = nil) {
        self.id = id
        self.contents = contents
        self.color = color
        self.width = width
        self.hoverColor = hoverColor
        self.handHover = handHover
        self.clickAction = clickAction
        self.clickColor = clickColor
        self.title = title
        self.popover = popover
    }
}
@available(macOS 14, *)
extension TableDefaults {
    public func createColumnInfo<T: Identifiable>(_ id: Int, contents: [ColumnContentInfo<T>], title: ColumnTitle, color: ((T) -> Color)? = nil, width: CGFloat? = nil, hoverColor: ((T) -> Color)? = nil, handHover: ((T) -> Bool)? = nil, popover: PopoverInfo<T>? = nil, clickColor: ((T) -> Color)? = nil, clickAction:  (@MainActor (T) -> Void)? = nil) -> ColumnInfo<T> {
        
        let colorNotNil = color ?? { _ in self.color }
        let widthNotNil: CGFloat? = width ?? self.width
        let hoverColorNotNil = hoverColor ?? (self.hoverColor == nil ? nil : { _ in self.hoverColor! })
        let handHover = handHover ?? {_ in self.handHover }
        let clickColor = clickColor ?? { _ in self.clickColor }
        return ColumnInfo(id: id, contents: contents, color: colorNotNil, width: widthNotNil, hoverColor: hoverColorNotNil, handHover: handHover, title: title, popover: popover, clickColor: clickColor, clickAction: clickAction)
    }
}
