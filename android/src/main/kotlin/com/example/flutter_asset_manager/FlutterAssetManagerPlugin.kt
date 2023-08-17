package com.example.flutter_asset_manager

import android.content.res.AssetManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAssetManagerPlugin */
class FlutterAssetManagerPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var assetManager: AssetManager

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_asset_manager")
    channel.setMethodCallHandler(this)
    assetManager = flutterPluginBinding.applicationContext.assets
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method ) {
      "loadBuffer" -> {
        assetManager.open(call.argument<String>("assetPath")!!).use { inputStream ->
          val buffer = ByteArray(inputStream.available())
          inputStream.read(buffer)
          result.success(buffer)
        }
      }
      "loadString" -> {
        assetManager.open(call.argument<String>("assetPath")!!).use { inputStream ->
          val buffer = ByteArray(inputStream.available())
          inputStream.read(buffer)
          result.success(String(buffer))
        }
      }
      "getAssetList" -> {
        val assetList = assetManager.list(call.argument<String>("assetDirectoryPath")!!)
        result.success(assetList?.toList())
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
