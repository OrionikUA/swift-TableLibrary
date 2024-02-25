import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableView<T: Identifiable>: View {
    
    let columnsInfo: [ColumnInfo<T>]
    let data: [T]
    let settings: TableSettings
    
    public init(columnsInfo: [ColumnInfo<T>], data: [T], settings: TableSettings) {
        self.columnsInfo = columnsInfo
        self.data = data
        self.settings = settings
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if (settings.lockHeadLine) {
                TableLineView(columnsInfo: columnsInfo, model: nil, settings: settings)
                    .fixedSize(horizontal: false, vertical: true)
            }
            ScrollView {
                VStack(spacing: 0) {
                    if (!settings.lockHeadLine) {
                        TableLineView(columnsInfo: columnsInfo, model: nil, settings: settings)
                    }
                    TableLineDivider()
                    ForEach(data) { input in
                        TableLineView(columnsInfo: columnsInfo, model: input, settings: settings)
                        TableLineDivider()
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}
