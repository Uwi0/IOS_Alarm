import Foundation

struct TimeComponent {
    let hour: Int
    let minute: Int
    let month: Int
    let year: Int
    
    init(hour: Int, minute: Int, month: Int, year: Int) {
        self.hour = hour
        self.minute = minute
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
        month: components.month ?? 0,
        year: components.year ?? 0
    )
}
