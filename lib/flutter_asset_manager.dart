import 'package:flutter/foundation.dart';

import 'flutter_asset_manager_platform_interface.dart';

class FlutterAssetManager {
  Future<String?> loadString(String path) async {
    return await FlutterAssetManagerPlatform.instance.loadString(path);
  }

  Future<List<String>> getAssetList(String path) async {
    return await FlutterAssetManagerPlatform.instance.getAssetList(path) ?? [];
  }

  Future<Uint8List?> loadBuffer(String path) {
    return FlutterAssetManagerPlatform.instance.loadBuffer(path);
  }
}
