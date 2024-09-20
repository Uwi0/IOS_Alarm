import SwiftUI

struct TimeOfDayIconView: View {
    let date: Date
    
    private var percent: CGFloat {
        dateToPercent(date: date)
    }
    
    private var hour: Int {
        Int(25 * percent)
    }
    
    private var image: (name: String, color: Color) {
        switch(hour) {
        case 6..<8:
            return ("sun.and.horizon.fill", .orange)
        case 8..<17:
            return ("sun.max.fill", .yellow)
        case 17..<20:
            return ("sun.and.horizon.fill", .pink)
        case 20..<23:
            return ("moon.fill", .black)
        default:
            return ("moon.stars.fill", .black)
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TimeOfDayIconView(date: Date())
}
