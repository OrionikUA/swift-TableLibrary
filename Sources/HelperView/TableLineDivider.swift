import SwiftUI

@available(macOS 14.0, *)
struct TableLineDivider: View {
    
    let isSelected: Bool
    
    init(isSelected: Bool = false) {
        self.isSelected = isSelected
    }
    
    var body: some View {
        Divider()
            .conditionalBackground(show: isSelected, color: .accentColor)
    }
}
