import SwiftUI

struct AlarmRowView: View {
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
    
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundStyle(model.activityColor)
                .font(.title)
            
            Text("\(getTimeFromDate(date: model.end))")
                .fontWeight(fontWeight)
                .scaleEffect(scaleEffect)
                .opacity(opacity)
            Spacer()
            
            //TODO: change this later
            TheToggleView(isOn: .constant(model.alarmEnabled))
        }
        
    }
}

#Preview {
    AlarmRowView(model: .DefaultAlarm(), index: 0)
}
