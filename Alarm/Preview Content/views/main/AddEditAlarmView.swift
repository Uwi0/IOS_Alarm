import SwiftUI

struct AddEditAlarmView: View {
    
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var showYouDitItView = true

    var body: some View {
        ZStack {
            backgroundColor
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                if showYouDitItView {
                    YouDidItView()
                }
                Text("ToBeWakeUpView")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.showYouDitItView = false
                }
            }
        }
    }
}

#Preview {
    AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
