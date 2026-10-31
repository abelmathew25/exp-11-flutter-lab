# Experiment 11 – Add iOS as a Build Target

A Flutter application configured with **iOS** as a build target (`ios/Runner.xcworkspace`),
tested with widget tests, and deployed as a Flutter Web app on GitHub Pages.

**Live demo:** https://abelmathew25.github.io/exp-11-flutter-lab/

## Features tested
- UI – app bar, icon, headings, status text
- Text field – name input with validation
- Buttons – *Test Button* shows a SnackBar, *Go to Next Screen* navigates
- Navigation & screen transitions – iOS-style (Cupertino) slide transition to a second screen and back
- Images – asset image on the second screen

## Steps
```bash
flutter doctor
flutter devices
flutter create ios_app
cd ios_app
open ios/Runner.xcworkspace      # macOS only – select an iOS Simulator in Xcode
flutter run                      # run on the selected simulator/device
flutter test                     # widget tests
flutter build ios --no-codesign  # macOS only
flutter build web --base-href /exp-11-flutter-lab/
```

## Building iOS without a Mac
`flutter build ios` needs macOS + Xcode. This repo's GitHub Actions workflow
(`.github/workflows/build.yml`) runs on a **macOS runner** and builds the iOS app with
`flutter build ios --release --no-codesign`. The `Runner.app` is uploaded as the `ios-build` artifact.
The same workflow builds the web version and deploys it to the `gh-pages` branch.
