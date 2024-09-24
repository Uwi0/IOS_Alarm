import SwiftUI

struct AlarmRowView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    let model: AlarmModel
    let index: Int
    
    private var fontWeight: Font.Weight {
        model.alarmEnabled ? .regular : .thin
    }
    private var scaleEffect: CGFloat {
        model.alarmEnabled ? 1.05 : 1.0
    }
    private var opacity: Double {
        model.alarmEnabled ? 1 : 0.7
    }
    private var alarmText: String {
        let alarmTime: (Date) -> String = { date in
            getTimeFromDate(date: date)
        }
        return "\(alarmTime(model.start)) - \(alarmTime(model.end))"
    }
    
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundStyle(model.activityColor)
                .font(.title)
            
            Text("\(alarmText)")
                .fontWeight(fontWeight)
                .scaleEffect(scaleEffect)
                .opacity(opacity)
            Spacer()
            
            //TODO: change this later
            if index < lnManager.alarmModels.count {
                TheToggleView(isOn: .constant(lnManager.alarmModels[index].alarmEnabled))
            }
            
        }
        .onChange(of: model.alarmEnabled) {
            if model.alarmEnabled {
                print("Enable alarm")
                Task {
                    await lnManager.schedule(localNotification: model)
                }
            } else {
                lnManager.removeRequest(id: model.id)
            }
        }
        
    }
}

#Preview {
    AlarmRowView(model: .DefaultAlarm(), index: 0)
        .environmentObject(LocalNotificationManager())
}
