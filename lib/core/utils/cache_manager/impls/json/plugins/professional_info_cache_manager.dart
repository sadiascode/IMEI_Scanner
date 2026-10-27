import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../logger/logger.dart';
import '../../../ifaces/json/plugins/json_cache_manager_iface.dart';
import '../../../models/profession_info_model.dart';

class ProfessionInfoCacheManager
    implements JsonCacheManagerIface<ProfessionInfoModel> {
  final String _dataKey = 'profession_info';

  const ProfessionInfoCacheManager();

  @override
  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dataKey);
    } catch (e, stackTrace) {
      Logger.log("ProfessionInfoCacheManager: Failed to clear data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }

  @override
  Future<ProfessionInfoModel?> read() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_dataKey);
      if (data == null || data.isEmpty) {
        return null;
      }
      final jsonData = jsonDecode(data) as Map<String, dynamic>;
      return ProfessionInfoModel.fromJson(jsonData);
    } catch (e, stackTrace) {
      Logger.log("ProfessionInfoCacheManager: Failed to read data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
    return null;
  }

  @override
  Future<void> save(ProfessionInfoModel data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = jsonEncode(data.toJson());
      final ok = await prefs.setString(_dataKey, json);
      if (ok) {
        Logger.log("ProfessionInfoCacheManager: Data saved successfully!");
      } else {
        Logger.log("ProfessionInfoCacheManager: Could not save data!");
      }
    } catch (e, stackTrace) {
      Logger.log(
        'ProfessionInfoCacheManager: Failed to save data!\n'
        'Error: $e\n'
        'StackTrace: $stackTrace',
      );
    }
  }
}
