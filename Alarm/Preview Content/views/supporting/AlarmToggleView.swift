import SwiftUI

struct AlarmToggleView: View {
    @Binding var alarmEnabled: Bool
        
    var body: some View {
        HStack {
            GrayedTextView(text: "Alarm")
            Spacer()
            TheToggleView(isOn: $alarmEnabled)
        }
        .padding()
    }
}

#Preview {
    AlarmToggleView(alarmEnabled: .constant(true))
}
