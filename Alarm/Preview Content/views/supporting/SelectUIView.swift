import SwiftUI

struct SelectUIView: View {
    
    @Binding var selectedType: AlarmType
    @Binding var isActive: Bool
    var body: some View {
        HStack {
            ForEach(AlarmType.allCases) {type in
                let isSelected = type == selectedType
                ImageButtonView(
                    imageType: type,
                    isSelected: isSelected,
                    onClick: {
                        withAnimation {
                            selectedType = type
                        }
                    }
                )
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

private struct ImageButtonView: View {
    
    let imageType: AlarmType
    let isSelected: Bool
    let onClick: () -> Void
    
    private var image: String {
        if imageType == .standard {
            return standardViewImage
        } else {
            return circularViewImage
        }
    }
    
    private var scaleEffect: CGFloat {
        isSelected ? 1.05 : 1.0
    }
    
    private var shadowRadius: CGFloat {
        isSelected ? 5 : 0
    }
    
    private let width: CGFloat = 50
    
    var body: some View {
        Button(
            action: {
                onClick()
            },
            label: {
                ImageDisplayView(name: image, width: width)
                    .scaleEffect(scaleEffect)
                    .shadow(color: .blue, radius: shadowRadius)
            }
        )
        
    }
}

#Preview {
    SelectUIView(selectedType: .constant(.standard), isActive: .constant(false))
}
