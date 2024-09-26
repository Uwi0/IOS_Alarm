import SwiftUI

struct MainAddEditAlarmView: View {
    @State var alarmModel: AlarmModel
    @State var currentAlarmIndex: Int?
    
    @State private var selectedTab = "One"
    var body: some View {
        TabView(selection: $selectedTab) {
            AddEditAlarmView(currentAlarmIndex: $currentAlarmIndex)
            .tag("One")
            
            AddEditCircularAlarmView(
                currentAlarmIndex: $currentAlarmIndex,
                alarmModel: alarmModel
            )
            .tag("Two")
        }
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

#Preview {
    MainAddEditAlarmView(alarmModel: .DefaultAlarm())
}
