import SwiftUI

@available(macOS 14, *)
public protocol IdentifiableAndTransferable: Identifiable where ID: Transferable {
}
