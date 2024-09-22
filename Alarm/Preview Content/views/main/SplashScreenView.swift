import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var opacity = 0.3
    @State private var fontSize = 12.0
    
    
    var body: some View {
        if isActive {
            MainAlarmView()
        } else {
            ZStack {
                FourCoolCirclesView(
                    color1: blue,
                    color2: .clear
                )
                
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        CoolTextView(text: "Hello there", size: fontSize)
                        CoolTextView(text: "let's add an alarm", size: fontSize)
                    }
                    .multilineTextAlignment(.leading)
                    .padding()
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            opacity = 1.0
                            fontSize = 26.0
                        }
                    }
                    Spacer()
                    Image(welcome)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.7)
                    Spacer()
                    
                }
            }
            .opacity(opacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation {
                        isActive.toggle()
                    }
                }
            }
            .onTapGesture {
                withAnimation {
                    isActive.toggle()
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
