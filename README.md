# PoseSnap 📸

PoseSnap is a Flutter application that uses your device's camera to capture and analyze human poses in real-time. It leverages the power of TensorFlow Lite to perform pose estimation directly on your mobile device.

## ✨ Features

*   **Real-time Pose Estimation:** Detect and visualize human body keypoints from the live camera feed.
*   **Image-based Pose Analysis:** Load images from your gallery and analyze poses within them.
*   **Pose Overlay:** Clearly visualizes detected poses by drawing skeletons over the camera preview or images.
*   **Save & Share:** Capture snapshots of poses and share them easily.
*   **User-friendly Interface:** Simple and intuitive controls for a smooth experience.

## 🚀 Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

*   Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
*   An IDE like Android Studio or VS Code with the Flutter plugin.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mraj555/PoseSnap.git
    cd posesnap
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```

### Platform Specific Setup

#### Android
*   Ensure you have added the necessary camera permissions to your `android/app/src/main/AndroidManifest.xml` file:
    ```xml
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-feature android:name="android.hardware.camera" />
    <uses-feature android:name="android.hardware.camera.autofocus" />
    ```
*   Ensure TensorFlow Lite model files (e.g., `*.tflite`) are included as assets in your `pubspec.yaml` and are accessible by the native Android code.

#### iOS
*   Ensure you have added the necessary camera permissions to your `ios/Runner/Info.plist` file:
    ```xml
    <key>NSCameraUsageDescription</key>
    <string>This app needs camera access to detect and analyze poses in real-time.</string>
    ```
*   Ensure TensorFlow Lite model files (e.g., `*.tflite`) are included as assets in your `pubspec.yaml` and are bundled with the iOS application.


## 🛠️ Built With

*   [Flutter](https://flutter.dev/) - The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   A TensorFlow Lite Flutter Plugin (e.g., `tflite_flutter`, `tflite_flutter_helper`, or a custom one like `tflite_next`) - For running TensorFlow Lite models.
*   [camera](https://pub.dev/packages/camera) - Flutter plugin for accessing device cameras.
*   [image_picker](https://pub.dev/packages/image_picker) - Flutter plugin for selecting images from the device gallery.