import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_asset_manager_platform_interface.dart';

/// An implementation of [FlutterAssetManagerPlatform] that uses method channels.
class MethodChannelFlutterAssetManager extends FlutterAssetManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_asset_manager');

  @override
  Future<Uint8List?> loadBuffer(String path) async {
    final buffer = await methodChannel.invokeMethod<Uint8List>('loadBuffer', {
      'assetPath': path,
    });
    return buffer;
  }

  @override
  Future<String?> loadString(String path) async {
    final string = await methodChannel.invokeMethod<String>('loadString', {
      'assetPath': path,
    });
    return string;
  }

  @override
  Future<List<String>?> getAssetList(String path) async {
    final list =
        await methodChannel.invokeMethod<List<Object?>>('getAssetList', {
      'assetDirectoryPath': path,
    });
    return list?.cast<String>();
  }
}
