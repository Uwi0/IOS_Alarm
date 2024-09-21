import SwiftUI

struct FourCoolCirclesView: View {
    var color1 = darkYellow
    var color2 = lightYellow
    
    @State private var offsetx: [CGFloat] = [0,0,0,0]
    @State private var offsety: [CGFloat] = [0,0,0,0]
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FourCoolCirclesView()
}
