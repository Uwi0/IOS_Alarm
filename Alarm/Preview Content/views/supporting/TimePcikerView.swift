import SwiftUI

struct TimePickerView: View {
    @Binding var time: Date
    let scale: CGFloat
    
    var body: some View {
        DatePicker(
            "",
            selection: $time,
            displayedComponents: .hourAndMinute
        )
        .scaleEffect(scale)
        .labelsHidden()
    }
}

#Preview {
    TimePickerView(time: .constant(Date()), scale: 1.3)
}
