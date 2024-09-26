import Foundation

enum AlarmType: String, CaseIterable, Identifiable {
    case standard, circular
    var id: String { self.rawValue }
}
