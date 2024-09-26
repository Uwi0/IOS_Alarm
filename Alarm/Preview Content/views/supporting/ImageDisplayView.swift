import SwiftUI

struct ImageDisplayView: View {
    let name: String
    let width: CGFloat
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

#Preview {
    ImageDisplayView(name: standardViewImage, width: 50)
}
