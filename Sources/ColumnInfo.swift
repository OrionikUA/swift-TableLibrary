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
    let titleContent: String
    let titleContentType: ColumnContentType
    let titleContentColor: Color
    let titleContentBackColor: Color
    let titleAlighnment: HorizontalAlignment
    let clickAction: ((T) -> Void)?
    let clickColor: ((T) -> Color)?
    
    static func sorted(obj1: ColumnInfo<T>, obj2: ColumnInfo<T>) -> Bool {
        return obj1.id < obj2.id
    }
    
    public init(id: Int, contents: [ColumnContentInfo<T>], color: @escaping (T) -> Color, width: CGFloat?, hoverColor: ((T) -> Color)?, handHover: @escaping (T) -> Bool, titleContent: String, titleContentType: ColumnContentType, titleContentColor: Color, titleContentBackColor: Color, titleAlighnment: HorizontalAlignment, clickColor: ((T) -> Color)?, clickAction: ((T) -> Void)? = nil) {
        self.id = id
        self.contents = contents
        self.color = color
        self.width = width
        self.hoverColor = hoverColor
        self.handHover = handHover
        self.titleContent = titleContent
        self.titleContentType = titleContentType
        self.titleContentColor = titleContentColor
        self.titleContentBackColor = titleContentBackColor
        self.titleAlighnment = titleAlighnment
        self.clickAction = clickAction
        self.clickColor = clickColor
    }
}
