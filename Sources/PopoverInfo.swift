import Foundation
import SwiftUI

@available(macOS 14, *)
public struct PopoverInfo<T: Identifiable> {
    let verticalActions: [Int: PopoverAction<T>]
    let minActionWidth: CGFloat?
    
    public init(verticalActions: [Int: PopoverAction<T>], minActionWidth: CGFloat? = nil) {
        self.verticalActions = verticalActions
        self.minActionWidth = minActionWidth
    }
}
@available(macOS 14, *)
public struct PopoverAction<T: Identifiable> {
    let action: (T) -> Void
    let isActive: (T) -> Bool
    let color: (T) -> Color?
    let name: String
    
    public init(action: @escaping (T) -> Void, isActive: @escaping (T) -> Bool = {_ in true}, name: String, color: @escaping (T) -> Color? = {_ in nil}) {
        self.action = action
        self.isActive = isActive
        self.name = name
        self.color = color
    }
}
