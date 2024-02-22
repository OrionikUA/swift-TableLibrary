import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableView<T: Identifiable>: View {
    
    let columnsInfo: [ColumnInfo<T>]
    let data: [T]
    let lockHeadLine: Bool
    
    public init(columnsInfo: [ColumnInfo<T>], data: [T], lockHeadLine: Bool) {
        self.columnsInfo = columnsInfo
        self.data = data
        self.lockHeadLine = lockHeadLine
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if (lockHeadLine) {
                TableLineView(columnsInfo: columnsInfo, model: nil)
                    .fixedSize(horizontal: false, vertical: true)
                TableLineDivider()
            }
            ScrollView {
                VStack(spacing: 0) {
                    if (!lockHeadLine) {
                        TableLineView(columnsInfo: columnsInfo, model: nil)
                        TableLineDivider()
                    }
                    ForEach(data) { input in
                        TableLineView(columnsInfo: columnsInfo, model: input)
                        TableLineDivider()
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}
