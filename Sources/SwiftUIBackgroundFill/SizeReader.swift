import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

public extension View {
    func sizeReader(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

#if DEBUG
    private struct Preview: View {
        @State private var size: CGSize = .zero

        var body: some View {
            VStack {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.accentColor)
                    }
            }
            .sizeReader { size in
                self.size = size
            }
        }

        var text: String {
            "Size: \(size.width.rounded()) x \(size.height.rounded())"
        }
    }

    #Preview {
        Preview()
    }
#endif
