import 'package:flutter_test/flutter_test.dart';
import 'package:yubikit_macos/yubikit_macos.dart';
import 'package:yubikit_macos/yubikit_macos_platform_interface.dart';
import 'package:yubikit_macos/yubikit_macos_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockYubikitMacosPlatform
    with MockPlatformInterfaceMixin
    implements YubikitMacosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final YubikitMacosPlatform initialPlatform = YubikitMacosPlatform.instance;

  test('$MethodChannelYubikitMacos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelYubikitMacos>());
  });

  test('getPlatformVersion', () async {
    YubikitMacos yubikitMacosPlugin = YubikitMacos();
    MockYubikitMacosPlatform fakePlatform = MockYubikitMacosPlatform();
    YubikitMacosPlatform.instance = fakePlatform;

    expect(await yubikitMacosPlugin.getPlatformVersion(), '42');
  });
}
