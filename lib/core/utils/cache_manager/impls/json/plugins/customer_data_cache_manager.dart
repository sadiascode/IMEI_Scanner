import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../logger/logger.dart';
import '../../../ifaces/json/plugins/json_cache_manager_iface.dart';
import '../../../models/customer_model.dart';

class CustomerDataCacheManager implements JsonCacheManagerIface<CustomerModel> {
  final String _dataKey = 'customer_data';

  const CustomerDataCacheManager();

  @override
  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dataKey);
    } catch (e, stackTrace) {
      Logger.log("CustomerDataCacheManager: Failed to clear data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }

  @override
  Future<CustomerModel?> read() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_dataKey);
      if (data == null || data.isEmpty) {
        return null;
      }
      final jsonData = jsonDecode(data) as Map<String, dynamic>;
      return CustomerModel.fromJson(jsonData);
    } catch (e, stackTrace) {
      Logger.log("CustomerDataCacheManager: Failed to read data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
    return null;
  }

  @override
  Future<void> save(CustomerModel data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_dataKey, jsonEncode(data.toJson()));
    } catch (e, stackTrace) {
      Logger.log("CustomerDataCacheManager: Failed to save data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }
}
