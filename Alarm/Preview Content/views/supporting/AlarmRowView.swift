import SwiftUI

struct AlarmRowView: View {
    
    let index: Int
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    private var model: AlarmModel {
        if lnManager.alarmModels.isEmpty {
            return AlarmModel.DummyAlarmData()[index]
        } else {
            return lnManager.alarmModels[index]
        }
    }
    
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
            
            Spacer()
            
            Text("\(alarmText)")
                .fontWeight(fontWeight)
                .scaleEffect(scaleEffect)
                .opacity(opacity)
            Spacer()
            
            if index < lnManager.alarmModels.count {
                TheToggleView(isOn: $lnManager.alarmModels[index].alarmEnabled)
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
    AlarmRowView(index: 0)
        .environmentObject(LocalNotificationManager())
}
