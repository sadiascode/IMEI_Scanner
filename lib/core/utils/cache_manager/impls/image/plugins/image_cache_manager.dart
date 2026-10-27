import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../logger/logger.dart';
import '../../../ifaces/image/plugins/image_cache_manager_iface.dart';

class ImageCacheManager implements ImageCacheManagerIface {
  final String _dataKey = '_imageBytesBase64';

  const ImageCacheManager();

  @override
  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dataKey);
    } catch (e, stackTrace) {
      Logger.log("AuthTokenCacheManager: Failed to clear data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }

  @override
  Future<Uint8List?> read() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final base64String = prefs.getString(_dataKey);
      if (base64String == null) return null;

      return base64Decode(base64String);
    } catch (e, stackTrace) {
      Logger.log("AuthTokenCacheManager: Failed to read data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
    return null;
  }

  @override
  Future<void> save(Uint8List data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final base64String = base64Encode(data);
      await prefs.setString(_dataKey, base64String);
    } catch (e, stackTrace) {
      Logger.log("AuthTokenCacheManager: Failed to save data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }
}
