import Foundation

@available(macOS 14, *)
public struct PopoverInfo<T: Identifiable> {
    let verticalActions: [Int: ((T) -> Void, String)]
    let minActionWidth: CGFloat?
    
    public init(verticalActions: [Int: ((T) -> Void, String)], minActionWidth: CGFloat? = nil) {
        self.verticalActions = verticalActions
        self.minActionWidth = minActionWidth
    }
}
