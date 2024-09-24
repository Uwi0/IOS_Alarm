import SwiftUI

struct ToBedWakeUpView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        NavigationStack {
            VStack {
                CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
                AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
                Divider()
                HStack {
                    Grid {
                        GridRow {
                            TimeOfDayIconView(date: alarmModel.start)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                GrayedTextView(text: "Start")
                                TimePickerView(time: $alarmModel.start, scale: 1.3)
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
                            SelectActivityView(
                                currentColorIndex: $alarmModel.colorIndex,
                                currentActivity: $alarmModel.activity
                            )
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
                                TimePickerView(time: $alarmModel.end, scale: 1.3)
                                GrayedTextView(text: "End")
                            }
                        }
                        GridRow {
                            Text("")
                            SoundMenuFromButtonView(alarmModel: $alarmModel)
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
}

#Preview {
    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
