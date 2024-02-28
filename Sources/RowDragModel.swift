import Foundation

@available(macOS 14, *)
public struct RowDragModel<T: Identifiable> {
    public let dragAction: (RowDragInput<T>) -> Void
    
    public init(dragAction: @escaping (RowDragInput<T>) -> Void) {
        self.dragAction = dragAction
    }
}

@available(macOS 14, *)
public struct RowDragInput<T: Identifiable> {
    public let source: T
    public let target: T
    
    public init(source: T, target: T) {
        self.source = source
        self.target = target
    }
}
