import 'package:shared_preferences/shared_preferences.dart';

import '../../../../logger/logger.dart';
import '../../../ifaces/string/plugins/cache_manager_iface.dart';

class CustomerNameCacheManager implements CacheManagerIface {
  final String _dataKey = 'customer_name_key';

  const CustomerNameCacheManager();

  @override
  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dataKey);
    } catch (e, stackTrace) {
      Logger.log("CustomerNameCacheManager: Failed to clear data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }

  @override
  Future<String?> read() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_dataKey);
    } catch (e, stackTrace) {
      Logger.log("CustomerNameCacheManager: Failed to read data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
    return null;
  }

  @override
  Future<void> save(String data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_dataKey, data);
    } catch (e, stackTrace) {
      Logger.log("CustomerNameCacheManager: Failed to save data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }
}
