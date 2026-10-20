# LiveChatSDK - iOS

A native iOS SDK that embeds the Helios live chat widget into your app via
`WKWebView`. It provides a draggable floating chat button, a corner-anchored
button, and UIKit wrappers — mirroring the Helios Flutter and Android SDKs.

## Features

- **Draggable chat button** — floats over your app and snaps to the edge when
  dragged near the screen border, collapsing into a side tab.
- **Anchored button** — a fixed floating button pinned to the bottom-trailing
  corner.

## Requirements

| Platform | Support   |
|----------|-----------|
| iOS      | ✅ 18.0+  |
| iPadOS   | ✅ 18.0+  |

## Installation

### Swift Package Manager (Xcode)

In Xcode: **File → Add Package Dependencies…** and enter:

```
https://github.com/PT-Helios-Informatika-Nusantara/LiveChatSDK-iOS.git
```

Choose a version rule (e.g. **Up to Next Major Version** from `1.3.2`) and add
the **LiveChatSDKiOS** product to your app target.

### Package.swift

```swift
dependencies: [
    .package(url: "https://github.com/PT-Helios-Informatika-Nusantara/LiveChatSDK-iOS.git", from: "1.3.2")
],
targets: [
    .target(name: "YourApp", dependencies: ["LiveChatSDKiOS"])
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

### Overlay Button

Place the overlay button in a `ZStack` above your content:

```swift
import SwiftUI
import LiveChatSDKCore

struct ContentView: View {
    var body: some View {
        ZStack {
            MyHomeView()
            LiveChatOverlayButton(config: LiveChatConfig(id: "your-widget-id"))
        }
    }
}
```

## Authentication Type

This library supports 3 authentication methods:
### 1. Email & Password:
Require members to log in with credentials before chatting.
##### Flow: 
Uses the exact same integration as described in the [Usage](#usage) section. No additional SDK configuration or code setup is required; the SDK automatically handles the login flow inside the default widget.
### 2. Guest Mode:
Collect a name and email without requiring authentication.
##### Flow:
Uses the exact same integration as described in the [Usage](#usage) section. No additional SDK configuration or code setup is required; the SDK automatically handles the login flow inside the default widget.
### 3. Token Authentication
##### Flow:
1. Enable **Token** as an authentication method in the Portal.
2. Get the API key from the Portal.
3. Set up your backend as required by the Portal (see the setup steps in the Portal).
4. Call the following code:

```swift
import SwiftUI
import LiveChatSDKCore

// Login
Button("Login"){
  HeliosLivechat.setMemberToken("your-token")
}

//Logout
Button("Logout"){
  HeliosLivechat.clearMemberToken()
}
```

## Configuration

`LiveChatConfig` requires a widget `id` and optionally styles the button:

| Parameter        | Type     | Default        | Description                              |
|------------------|----------|----------------|------------------------------------------|
| `id`             | `String` | —              | The widget ID provided by Helios.        |


## License

[EULA](LICENSE)
