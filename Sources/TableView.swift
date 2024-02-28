import Foundation
import SwiftUI

@available(macOS 14, *)
public struct TableView<T: IdentifiableAndTransferable>: View {
    
    let columnsInfo: [ColumnInfo<T>]
    let data: [T]
    let settings: TableSettings
    let rowDrag: RowDragModel<T>?
    
    @State var selectedItem: T? = nil
    
    func isItemSelected(item: T) -> Bool {
        guard let selectedItem = selectedItem else {
            return false
        }
        if (selectedItem.id == item.id) {
            print("Selected")
        }
        return selectedItem.id == item.id
    }
    
    public init(columnsInfo: [ColumnInfo<T>], data: [T], settings: TableSettings, rowDrag: RowDragModel<T>? = nil) {
        self.columnsInfo = columnsInfo
        self.data = data
        self.settings = settings
        self.rowDrag = rowDrag
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if (!settings.hideHeadLine && settings.lockHeadLine) {
                TableLineView(columnsInfo: columnsInfo, model: nil, settings: settings)
                    .fixedSize(horizontal: false, vertical: true)
            }
            ScrollView {
                VStack(spacing: 0) {
                    if (!settings.hideHeadLine && !settings.lockHeadLine) {
                        TableLineView(columnsInfo: columnsInfo, model: nil, settings: settings)
                    }
                    ForEach(data) { input in
                        TableLineDivider(isSelected: isItemSelected(item: input))
                        TableLineView(columnsInfo: columnsInfo, model: input, settings: settings)
                            .conditionalDraggable(rowDrag != nil, item: input) {
                                TableLineView(columnsInfo: columnsInfo, model: input, settings: settings)
                            }
                            .conditionalDropDestination(rowDrag != nil, item: input) { items, location in
                                guard let sourceId = items.first else {
                                    return false
                                }
                                guard let source: T = data.first(where: {$0.id == sourceId}) else {
                                    return false
                                }
                                guard let rowDrag = rowDrag else {
                                    return false
                                }
                                rowDrag.dragAction(RowDragInput(source: source, target: input))
                                return true
                            } isTargeted: { isTargeted in
                                selectedItem = isTargeted ? input : nil
                            }
                    }
                    TableLineDivider()
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}
