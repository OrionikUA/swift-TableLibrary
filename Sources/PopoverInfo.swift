import Foundation

@available(macOS 14, *)
public struct PopoverInfo<T: Identifiable> {
    let verticalActions: [String: (T) -> Void]
    
    public init(verticalActions: [String: (T) -> Void]) {
        self.verticalActions = verticalActions
    }
}
