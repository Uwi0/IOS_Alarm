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
                ContentToBexWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            }
            .padding()
            .background(cardBackgroundColor.cornerRadius(20))
            .padding()
        }
    }
}

private struct ContentToBexWakeUpView: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        HStack {
            Grid {
                StartAlarmView(alarmModel: $alarmModel)
                VerticalDividerContentView()
                SelectAtivityContentView(alarmModel: $alarmModel)
                VerticalDividerContentView()
                EndAlarmView(alarmModel: $alarmModel)
                SelectedSoundContentView(alarmModel: $alarmModel)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
    }
    
}

private struct StartAlarmView: View {
    
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        GridRow {
            TimeOfDayIconView(date: alarmModel.start)
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                GrayedTextView(text: "Start")
                TimePickerView(time: $alarmModel.start, scale: 1.3)
            }
        }
    }
}

private struct VerticalDividerContentView : View {
    var body: some View {
        GridRow {
            HStack {
                Divider()
                    .frame(height: 30)
                    .padding(2)
            }
        }
    }
}

private struct SelectAtivityContentView : View {
    
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        GridRow {
            Image(systemName: alarmModel.activity)
                .foregroundStyle(alarmModel.activityColor)
                .font(.headline)
            SelectActivityView(
                currentColorIndex: $alarmModel.colorIndex,
                currentActivity: $alarmModel.activity
            )
        }
    }
}

private struct EndAlarmView: View {
    
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        GridRow {
            TimeOfDayIconView(date: alarmModel.end)
                .font(.largeTitle)
            VStack(alignment: .leading) {
                TimePickerView(time: $alarmModel.end, scale: 1.3)
                GrayedTextView(text: "End")
            }
        }
    }
}

private struct SelectedSoundContentView : View {
    
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        GridRow {
            Text("")
            SoundMenuFromButtonView(alarmModel: $alarmModel)
        }
    }
}

#Preview {
    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
