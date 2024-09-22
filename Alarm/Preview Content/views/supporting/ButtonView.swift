import SwiftUI

struct ButtonView: View {
    
    let text: LocalizedStringKey
    var endRadius: CGFloat = 40
    var scaleX: CGFloat = 3.0
    
    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                MainGradientView(endRadius: endRadius, scaleX: scaleX)
            )
            .cornerRadius(30)
        
    }
}

#Preview {
    VStack {
        ButtonView(text: "Add alarm")
        ButtonView(text: "Next")
        ButtonView(text: "Create")
    }
    .padding()
}
