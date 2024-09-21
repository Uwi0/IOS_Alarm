import Foundation
import SwiftUI

struct AlarmModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let body: String
    let repeats: Bool
    
    var sound: Sounds
    var alarmEnabled: Bool
    var start: Date
    var end: Date
    var activity: String
    var colorIndex: Int
    var activityColor: Color {
        mainColors[colorIndex]
    }
    var timeIntervale: TimeInterval {
        end - start
    }
    var startTime: TimeModel {
        dateTimeToModel(date: start)
    }
    var endTime: TimeModel {
        dateTimeToModel(date: end)
    }
    
    static func DefaultAlarm() -> AlarmModel {
        AlarmModel(
            title: "Activity completed",
            body: "Have a great day!",
            repeats: false,
            sound: Sounds.lagrima,
            alarmEnabled: false,
            start: Date(),
            end: Date(),
            activity: activities[0],
            colorIndex: 0
        )
    }
}
