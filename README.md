# SwiftUIBackgroundFill

## Overview
SwiftUIBackgroundFill provides a SwiftUI ViewModifier that adds a background to a view that fills the entire view. 

## Installation
Install SwiftUIBackgroundFill using the Swift Package Manager. Add it as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/ugoArangino/SwiftUIBackgroundFill.git", from: "1.0.0")
]
```

Then add SwiftUIBackgroundFill to your target dependencies, like this:

```swift
.target(name: "YourTarget", dependencies: [
    .product(name: "SwiftUIBackgroundFill", package: "SwiftUIBackgroundFill"),
])
```

## [Example](./Example)
### 1. Usage
To use SwiftUIBackgroundFill, import the package and use the backgroundFill modifier. Here is a basic example:

```swift
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
```
