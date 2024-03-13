import Foundation

@available(macOS 14, *)
public struct PopoverInfo<T: Identifiable> {
    let verticalActions: [Int: ((T) -> Void, String)]
    
    public init(verticalActions: [Int: ((T) -> Void, String)]) {
        self.verticalActions = verticalActions
    }
}
