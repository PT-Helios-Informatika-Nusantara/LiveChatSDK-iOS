# HeliosLiveChat

A native iOS SDK that embeds the Helios live chat widget into your app via
`WKWebView`. It provides a draggable floating chat button, a corner-anchored
button, and UIKit wrappers — mirroring the Helios Flutter and Android SDKs.

## Features

- **Draggable chat button** — floats over your app and snaps to the edge when
  dragged near the screen border, collapsing into a side tab.
- **Anchored button** — a fixed floating button pinned to the bottom-trailing
  corner.
- **SwiftUI & UIKit** — first-class APIs for both.

## Requirements

| Platform | Support   |
|----------|-----------|
| iOS      | ✅ 13.0+  |
| iPadOS   | ✅ 13.0+  |

## Installation

### Swift Package Manager (Xcode)

In Xcode: **File → Add Package Dependencies…** and enter:

```
https://github.com/singgihrama11/ios-native-sdk.git
```

Choose a version rule (e.g. **Up to Next Major Version** from `1.0.1`) and add
the **HeliosLiveChat** product to your app target.

### Package.swift

```swift
dependencies: [
    .package(url: "https://github.com/singgihrama11/HeliosLiveChatIOS.git", from: "1.0.1")
],
targets: [
    .target(name: "YourApp", dependencies: ["HeliosLiveChatIOS"])
]
```

## Platform Setup

The chat uses the camera, microphone, and photo library. Add the usage
descriptions to your app's **Info.plist**, otherwise iOS terminates the app when
a permission is requested without its description:

```xml
<key>NSCameraUsageDescription</key>
<string>Used to send photos in live chat.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Used for voice messages in live chat.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used to attach images to live chat messages.</string>
```

## Usage

### SwiftUI

Place the overlay button in a `ZStack` above your content:

```swift
import SwiftUI
import HeliosLiveChatCore

struct ContentView: View {
    var body: some View {
        ZStack {
            MyHomeView()
            LiveChatOverlayButton(config: LiveChatConfig(id: "your-widget-id"))
        }
    }
}
```

### UIKit

Add the draggable overlay on top of your content:

```swift
import HeliosLiveChatCore

let overlay = LiveChatOverlayButtonView(config: LiveChatConfig(id: "your-widget-id"))
overlay.frame = view.bounds
overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
view.addSubview(overlay)
```

## Configuration

`LiveChatConfig` requires a widget `id` and optionally styles the button:

| Parameter        | Type     | Default        | Description                              |
|------------------|----------|----------------|------------------------------------------|
| `id`             | `String` | —              | The widget ID provided by Helios.        |


## License

[MIT](LICENSE)
