import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'yubikit_macos_method_channel.dart';

abstract class YubikitMacosPlatform extends PlatformInterface {
  /// Constructs a YubikitMacosPlatform.
  YubikitMacosPlatform() : super(token: _token);

  static final Object _token = Object();

  static YubikitMacosPlatform _instance = MethodChannelYubikitMacos();

  /// The default instance of [YubikitMacosPlatform] to use.
  ///
  /// Defaults to [MethodChannelYubikitMacos].
  static YubikitMacosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [YubikitMacosPlatform] when
  /// they register themselves.
  static set instance(YubikitMacosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
