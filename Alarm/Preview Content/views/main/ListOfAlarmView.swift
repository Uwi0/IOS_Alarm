import SwiftUI


struct ListOfAlarmView: View {
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    @State var isActive: Bool = false
    @State var currentIndex: Int? = nil
    @State var selectedAlarm: AlarmType = .circular
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmModels.indices, id: \.self) { index in
                        
                        let alarm = lnManager.alarmModels[index]
                        
                        Button(
                            action: {
                                currentIndex = index
                                isActive.toggle()
                            },
                            label: {
                                AlarmRowView(model: alarm, index: index)
                                    .padding()
                            }
                        )
                    }
                    .onDelete(perform: deleteAlarm)
                }
                FourCoolCirclesView().opacity(0.3)
            }
            .navigationTitle("Alarms")
            .sheet(isPresented: $isActive, onDismiss: {}){
                AlarmSelectorModeView(selectedAlarm: $selectedAlarm, currentIndex: $currentIndex)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(
                        action: {
                            isActive.toggle()
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
    
    func deleteAlarm(offsets: IndexSet) {
        for index in offsets {
            lnManager.removeRequest(id: lnManager.alarmModels[index].id)
        }
        lnManager.alarmModels.remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfAlarmView()
        .environmentObject(LocalNotificationManager())
}
