import SwiftUI

struct BackgroundFill<Background: View>: ViewModifier {
    @State private var contentSize: CGSize = .zero

    public var background: Background

    public init(@ViewBuilder background: () -> Background) {
        self.background = background()
    }

    func body(content: Content) -> some View {
        ZStack {
            background
                .scaledToFill()
                .frame(width: contentSize.width, height: contentSize.height)
                .clipped()

            content
                .sizeReader { size in
                    contentSize = size
                }
        }
    }
}

public extension View {
    func backgroundFill<Background: View>(@ViewBuilder background: () -> Background) -> some View {
        modifier(BackgroundFill(background: background))
    }
}

#if DEBUG
    #Preview {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            Text("Card view")
                .font(.headline)
        }
        .foregroundColor(.white)
        .padding(32)
        .padding(.horizontal, 64)
        .backgroundFill {
            let imageURL = URL(string: "https://picsum.photos/id/36/1000/1500")
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .overlay(.black.opacity(0.5))
            } placeholder: {
                Color.accentColor
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
#endif
