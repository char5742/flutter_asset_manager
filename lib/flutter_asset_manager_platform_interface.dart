import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_asset_manager_method_channel.dart';

abstract class FlutterAssetManagerPlatform extends PlatformInterface {
  /// Constructs a FlutterAssetManagerPlatform.
  FlutterAssetManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAssetManagerPlatform _instance =
      MethodChannelFlutterAssetManager();

  /// The default instance of [FlutterAssetManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAssetManager].
  static FlutterAssetManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAssetManagerPlatform] when
  /// they register themselves.
  static set instance(FlutterAssetManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Uint8List?> loadBuffer(String path) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> loadString(String path) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<String>?> getAssetList(String path) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
