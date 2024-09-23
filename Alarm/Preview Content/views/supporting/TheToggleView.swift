import SwiftUI

struct TheToggleView: View {
    var width = 35.0
    let factor = 59.0 / 35.0
    @Binding var isOn: Bool
    
    private let offsetDelta = 12.0
    private var sign: Double {
        isOn ? 1.0 : -1.0
    }
    private var xShift: Double {
        sign * offsetDelta
    }
    private var backgroundWhiteness: Double {
        var result = xShift + offsetDelta
        result = result / (2 * offsetDelta)
        result = result * 0.5
        result = 0.5 - result
        return result
    }
    private var textColor: Color {
        isOn ? lightGray : black
    }
    private var onOffText: LocalizedStringKey {
        isOn ? "On" : "Off"
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                withAnimation(.easeIn(duration: 0.2)) {
                    isOn = value.translation.width > 0
                }
            }
        let tapGesture = TapGesture()
            .onEnded {
                withAnimation(.easeIn(duration: 0.2)) {
                    isOn.toggle()
                }
            }
        let combinedGesture = dragGesture.simultaneously(with: tapGesture)
        
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(white: backgroundWhiteness))
            ShiftedText(text: onOffText, color: textColor, xShift: -xShift)
            ShiftedCircle(xShift: xShift)
        }
        .frame(width: width * factor, height: width, alignment: .leading)
        .gesture(combinedGesture)
    }
}

struct ShiftedText: View {
    let text: LocalizedStringKey
    let color: Color
    let xShift: Double
    
    var body: some View {
        Text(text)
            .foregroundStyle(color)
            .font(.subheadline)
            .offset(x: xShift)
    }
}

struct ShiftedCircle: View {
    var color: Color = cardBackgroundColor
    let xShift: Double
    var padding: Double = 7.0
    
    var body: some View {
         Circle()
            .fill(color)
            .offset(x: xShift)
            .padding(padding)
    }
}

#Preview {
    VStack {
        TheToggleView(isOn: .constant(true))
        TheToggleView(isOn: .constant(false))
    }
}
