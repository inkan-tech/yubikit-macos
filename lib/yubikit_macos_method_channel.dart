import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'yubikit_macos_platform_interface.dart';

/// An implementation of [YubikitMacosPlatform] that uses method channels.
class MethodChannelYubikitMacos extends YubikitMacosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('yubikit_macos');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
