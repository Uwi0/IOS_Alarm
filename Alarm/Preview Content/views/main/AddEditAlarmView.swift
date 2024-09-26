import SwiftUI

struct AddEditAlarmView: View {
    
    @Binding var currentAlarmIndex: Int?
    @State private var showYouDitItView = true
    @EnvironmentObject var lnManager: LocalNotificationManager

    var body: some View {
        ZStack {
            backgroundColor
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                if showYouDitItView {
                    YouDidItView()
                }
                if currentAlarmIndex != nil {
                    ToBedWakeUpView(
                        currentAlarmIndex: currentAlarmIndex,
                        alarmModel: lnManager.alarmModels[currentAlarmIndex ?? 0]
                    )
                }else{
                    ToBedWakeUpView(
                        currentAlarmIndex: currentAlarmIndex,
                        alarmModel: .DefaultAlarm()
                    )
                }
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
    AddEditAlarmView(currentAlarmIndex: .constant(nil))
        .environmentObject(LocalNotificationManager())
}
