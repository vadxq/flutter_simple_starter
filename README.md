# flutter_simple_starter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## install

```bash
# install pub

# build generate
dart run build_runner build # or dart run build_runner watch

# husky
dart run husky install
```

## run (Bash)

maby you need to use R or r to reload

- dev

```bash

# iOS
open -a Simulator && flutter run -d ios --dart-define=APP_ENV=dev

# web
flutter run -d chrome --web-port=8080 --web-hostname=localhost --dart-define=APP_ENV=dev --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false --web-renderer canvaskit
```

- prod

```bash
# iOS
open -a Simulator && flutter run -d ios --dart-define=APP_ENV=release

# web
flutter run -d chrome --web-port=8080 --web-hostname=localhost --dart-define=APP_ENV=release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false --web-renderer canvaskit
```

## run in vscode

Run the command according to the above configuration

F5, select the device in the lower right corner, the default is the local device, macos or linux or windows

### build

- dev

```bash
# iOS
flutter build web --release --dart-define=APP_ENV=dev
# web
flutter build ios --release --dart-define=APP_ENV=dev
```

- prod

```bash
# iOS
flutter build ios --release --dart-define=APP_ENV=release
# web
flutter build web --release --dart-define=APP_ENV=release
```