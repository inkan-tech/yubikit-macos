import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yubikit_macos/yubikit_macos_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelYubikitMacos platform = MethodChannelYubikitMacos();
  const MethodChannel channel = MethodChannel('yubikit_macos');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
