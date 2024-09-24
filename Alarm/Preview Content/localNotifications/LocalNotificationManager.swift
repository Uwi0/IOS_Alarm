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
    
    func schedule(localNotification: AlarmModel) async {
        let content = UNMutableNotificationContent()
        let dateComponents = localNotification.endDateComponent
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(
            identifier: localNotification.id,
            content: content,
            trigger: trigger
        )
        content.body = NSLocalizedString(localNotification.body, comment: "")
        content.sound = customSound(soundName: localNotification.sound)
        try? await notificationCenter.add(request)
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }
    
    private func saveItems() {
        if let endcodeDate = try? JSONEncoder().encode(alarmModels) {
            UserDefaults.standard.set(endcodeDate, forKey: itemKey)
        }
    }
    
    private func customSound(soundName: Sounds, fileExtensions: String = "") -> UNNotificationSound {
        let period = fileExtensions.isEmpty ? "" : "."
        let fileName = "\(soundName.rawValue)\(period)\(fileExtensions)"
        return UNNotificationSound(named: UNNotificationSoundName(rawValue: fileName))
    }
    

}
