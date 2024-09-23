import SwiftUI

struct ListOfAlarmView: View {
    
    var alarms: [AlarmModel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(0..<alarms.count, id: \.self) { index in
                        let alarm = alarms[index]
                        NavigationLink(
                            destination: {
                                AddEditAlarmView(
                                    currentAlarmIndex: index,
                                    alarmModel: alarm
                                )
                            },
                            label: {
                                AlarmRowView(model: alarm, index: index)
                            })
                    }
                }
                FourCoolCirclesView().opacity(0.3)
            }
            .navigationTitle("Alarms")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(
                        destination: {
                            AddEditAlarmView(
                                currentAlarmIndex: nil,
                                alarmModel: .DefaultAlarm()
                            )
                        },
                        label: {
                            Text("+")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }
                    )
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    ListOfAlarmView(alarms: AlarmModel.DummyAlarmData())
}
