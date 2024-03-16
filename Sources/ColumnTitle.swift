import SwiftUI

@available(macOS 14, *)
public struct ColumnTitle {
    let systemImage: String?
    let text: String?
    let textColor: Color
    let backColor: Color
    let alighnment: HorizontalAlignment
    
    init(systemImage: String?, text: String?, textColor: Color, backColor: Color, alighnment: HorizontalAlignment) {
        self.systemImage = systemImage
        self.text = text
        self.textColor = textColor
        self.backColor = backColor
        self.alighnment = alighnment
    }
}

@available(macOS 14, *)
extension TableDefaults {
    
    public var empty: ColumnTitle {
        ColumnTitle(systemImage: nil, text: nil, textColor: .clear, backColor: .clear, alighnment: .center)
    }
    
    public func text(_ inText: String, textColor: Color? = nil, backColor: Color? = nil, alighnment: HorizontalAlignment? = nil) -> ColumnTitle {
        let textColorNotNil = textColor ?? self.titleTextColor
        let backColorNotNil = backColor ?? self.titleBackColor
        let alighnmentNotNil = alighnment ?? self.titleAlighnment
        return ColumnTitle(systemImage: nil, text: inText, textColor: textColorNotNil, backColor: backColorNotNil, alighnment: alighnmentNotNil)
    }
    
    public func systemImage(_ inText: String, textColor: Color? = nil, backColor: Color? = nil, alighnment: HorizontalAlignment? = nil) -> ColumnTitle {
        let textColorNotNil = textColor ?? self.titleTextColor
        let backColorNotNil = backColor ?? self.titleBackColor
        let alighnmentNotNil = alighnment ?? self.titleAlighnment
        return ColumnTitle(systemImage: inText, text: nil, textColor: textColorNotNil, backColor: backColorNotNil, alighnment: alighnmentNotNil)
    }
    
    public func textAndSystemImage(_ inText: String, _ inSystemImage: String, textColor: Color? = nil, backColor: Color? = nil, alighnment: HorizontalAlignment? = nil) -> ColumnTitle {
        let textColorNotNil = textColor ?? self.titleTextColor
        let backColorNotNil = backColor ?? self.titleBackColor
        let alighnmentNotNil = alighnment ?? self.titleAlighnment
        return ColumnTitle(systemImage: inSystemImage, text: inText, textColor: textColorNotNil, backColor: backColorNotNil, alighnment: alighnmentNotNil)
    }
}
