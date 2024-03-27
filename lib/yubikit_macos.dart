
import 'yubikit_macos_platform_interface.dart';

class YubikitMacos {
  Future<String?> getPlatformVersion() {
    return YubikitMacosPlatform.instance.getPlatformVersion();
  }
}
