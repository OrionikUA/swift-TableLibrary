import SwiftUI

@available(macOS 14, *)
struct TableLineView<T: Identifiable>: View {
    
    let columnsInfo: [ColumnInfo<T>]
    let model: T?
    let settings: TableSettings
    
    var body: some View {
        HStack(spacing: 0) {
            let sortedColumns = columnsInfo.sorted(by: ColumnInfo.sorted)
            let lastId = sortedColumns.last?.id ?? 0
            if (settings.addLeftBorder) {
                ColumnDivider()
            }
            ForEach(sortedColumns) { column in
                CellView(column: column, model: model)
                if (lastId != column.id || settings.addRightBorder) {
                    ColumnDivider()
                }
            }
        }
    }
}
