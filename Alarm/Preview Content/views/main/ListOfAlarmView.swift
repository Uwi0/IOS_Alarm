import SwiftUI

struct ListOfAlarmView: View {
    
    var alarms: [AlarmModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<alarms.count, id: \.self) { index in
                    let alarm = alarms[index]
                    NavigationLink(
                        destination: {
                            Text("Date for alarm \(index)")
                        },
                        label: {
                            Image(systemName: alarm.activity)
                                .foregroundStyle(alarm.activityColor)
                            Text("Alarm Row View")
                        })
                }
            }
            .navigationTitle("Alarms")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(
                        destination: {
                            Text("Create new Alarm")
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
