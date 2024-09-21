import Foundation

struct TimeComponent {
    let hour: Int
    let minute: Int
    let day: Int
    let month: Int
    let year: Int
    
    init(hour: Int, minute: Int, day: Int,month: Int, year: Int) {
        self.hour = hour
        self.minute = minute
        self.day = day
        self.month = month
        self.year = year
    }
}

func dateToPercent(date: Date) -> CGFloat {
    let result = getTimeComponent(date: date)
    return CGFloat(result.hour) / 24 + CGFloat(result.minute) / (60 * 24)
}

func getTimeComponent(date: Date) -> TimeComponent {
    let components = Calendar.current.dateComponents([.hour, .minute, .month, .year], from: date)
    return TimeComponent(
        hour: components.hour ?? 0,
        minute: components.minute ?? 0,
        day: components.day ?? 0,
        month: components.month ?? 0,
        year: components.year ?? 0
    )
}

func getTimeFromDate(date: Date) -> String {
    let result = getTimeComponent(date: date)
    let time = String(format: "%02d:%02d", result.hour, result.minute)
    return time
}

func addHourToDate(date: Date, numHours: Int, numMinutes: Int) -> Date {
    date.addingTimeInterval(TimeInterval((numMinutes * 60) + (numHours * 60 * 60)))
}

func formatDate(date: Date) -> String {
    let result = getTimeComponent(date: date)
    return "\(result.day)-\(result.month)-\(result.year)(\(result.hour):\(result.minute))"
}

func dateTimeToModel(date: Date) -> TimeModel {
    let result = getTimeComponent(date: date)
    return TimeModel(hours: result.hour, minutes: result.minute)
}

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
