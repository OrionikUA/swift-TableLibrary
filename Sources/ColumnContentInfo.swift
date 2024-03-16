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
    
    public init(id: Int, defaults: TableDefaults, type: ColumnContentType, color: ((T) -> Color?)? = nil, content: ((T) -> String)? = nil) {
        self.id = id
        self.type = type
        self.color = color ?? { _ in defaults.columnContentColor}
        self.content = content ?? {_ in defaults.columnContent}
    }
}

@available(macOS 14, *)
extension ColumnContentInfo {
    public static func spacer(_ id: Int) -> ColumnContentInfo<T> {
        ColumnContentInfo<T>(id: id, type: .spacer, color: { _ in nil }) { _ in "" }
    }
}

@available(macOS 14, *)
extension TableDefaults {
    
    public func systemImage<T: Identifiable>(_ id: Int, content: String) -> ColumnContentInfo<T> {
        ColumnContentInfo(id: id, defaults: self, type: .sysemImage, color: nil, content: {_ in content })
    }
    
    public func systemImage<T: Identifiable>(_ id: Int, color: @escaping (T) -> Color?, content: @escaping (T) -> String) -> ColumnContentInfo<T> {
        ColumnContentInfo(id: id, defaults: self, type: .sysemImage, color: color, content: content)
    }
    
    public func systemImage<T: Identifiable>(_ id: Int, color: Color, content: String) -> ColumnContentInfo<T> {
        ColumnContentInfo(id: id, defaults: self, type: .sysemImage, color: { _ in color}, content: { _ in content })
    }
    
    public func text<T: Identifiable>(_ id: Int, content: @escaping (T) -> String) -> ColumnContentInfo<T> {
        ColumnContentInfo(id: id, defaults: self, type: .text, color: nil, content: content)
    }
    
    public func text<T: Identifiable>(_ id: Int, color: Color, content: @escaping (T) -> String) -> ColumnContentInfo<T> {
        ColumnContentInfo(id: id, defaults: self, type: .text, color: {_ in color}, content: content)
    }
    
    public func text<T: Identifiable>(_ id: Int, color: @escaping (T) -> Color, content: @escaping (T) -> String) -> ColumnContentInfo<T> {
        ColumnContentInfo(id: id, defaults: self, type: .text, color: color, content: content)
    }
}
