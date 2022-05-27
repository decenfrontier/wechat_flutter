import 'dart:io';

String getPlatform() {
  // "android" "fuchsia" "ios" "linux" "macos" "windows"
  return Platform.operatingSystem;
}
