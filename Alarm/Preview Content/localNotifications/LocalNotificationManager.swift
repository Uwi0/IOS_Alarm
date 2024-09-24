import Foundation
import NotificationCenter

@MainActor
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isAuthorized: Bool = false
    @Published var pendingAlarms: [UNNotificationRequest] = []
    @Published var alarmModels: [AlarmModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let itemKey = "Alarm List"
    
    override init() {
        super.init()
        //TODO: Want alarm to go off when app is also active
        
        
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItems = try? JSONDecoder().decode([AlarmModel].self, from: data)
        else { return }
        self.alarmModels = savedItems
    }
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isAuthorized = currentSettings.authorizationStatus == .authorized
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    func getPendingAlarms() async {
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }
    
    private func saveItems() {
        if let endcodeDate = try? JSONEncoder().encode(alarmModels) {
            UserDefaults.standard.set(endcodeDate, forKey: itemKey)
        }
    }
}
