import SwiftUI

struct ToBedWakeUpView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            Text("Cancel or Save Alarm")
            Text("Toggle Alarm")
            Divider()
            HStack {
                Grid {
                    GridRow {
                        TimeOfDayIconView(date: alarmModel.start)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            GrayedTextView(text: "Start")
                            Text("Time Picker")
                        }
                    }
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    GridRow {
                        Image(systemName: alarmModel.activity)
                            .foregroundStyle(alarmModel.activityColor)
                            .font(.headline)
                        Text("SelectActivityView")
                    }
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    GridRow {
                        TimeOfDayIconView(date: alarmModel.start)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text("Time Picker")
                            GrayedTextView(text: "End")
                        }
                    }
                    GridRow {
                        Text("")
                        HStack {
                            Text("Sound")
                                .fontWeight(.semibold)
                            Text(alarmModel.sound.rawValue)
                                .font(.caption)
                                .fontWeight(.thin)
                        }
                        .padding(7)
                        .overlay {
                            Capsule().stroke()
                        }
                        .contextMenu {
                            ForEach(Sounds.allCases, id: \.self) { sound in
                                Button(
                                    action: {
                                        alarmModel.sound = sound
                                    },
                                    label: {
                                        Text(sound.rawValue)
                                    }
                                )
                            }
                            .padding(.vertical)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }.padding()
        }
        .padding()
        .background(cardBackgroundColor.cornerRadius(20))
        .padding()
    }
}

#Preview {
    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
