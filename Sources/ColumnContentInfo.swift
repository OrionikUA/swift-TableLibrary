import Foundation
import SwiftUI

@available(macOS 14, *)
public struct ColumnContentInfo<T>: Identifiable {
    public let id: Int
    
    var type: ColumnContentType
    var color: (T) -> Color?
    var content: (T) -> String
    
    static func sorted(obj1: ColumnContentInfo<T>, obj2: ColumnContentInfo<T>) -> Bool {
        return obj1.id < obj2.id
    }
    
    public init(id: Int, type: ColumnContentType, color: @escaping (T) -> Color?, content: @escaping (T) -> String) {
        self.id = id
        self.type = type
        self.color = color
        self.content = content
    }
}

@available(macOS 14, *)
extension ColumnContentInfo {
    public static func spacer(id: Int) -> ColumnContentInfo<T> {
        return ColumnContentInfo<T>(id: id, type: .spacer, color: { _ in nil }) { _ in
            return ""
        }
    }
}
