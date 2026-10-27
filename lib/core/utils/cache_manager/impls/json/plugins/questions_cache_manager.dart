import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../logger/logger.dart';
import '../../../ifaces/json/plugins/json_cache_manager_iface.dart';
import '../../../models/question_model.dart';

class QuestionsCacheManager implements JsonCacheManagerIface<QuestionModel> {
  final String _dataKey = 'questions_info';

  const QuestionsCacheManager();

  @override
  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_dataKey);
    } catch (e, stackTrace) {
      Logger.log("QuestionsCacheManager: Failed to clear data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
  }

  @override
  Future<QuestionModel?> read() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_dataKey);
      if (data == null || data.isEmpty) {
        return null;
      }
      final jsonData = jsonDecode(data) as Map<String, dynamic>;
      return QuestionModel.fromJson(jsonData);
    } catch (e, stackTrace) {
      Logger.log("QuestionsCacheManager: Failed to read data!");
      Logger.log("Error: $e\nStackTrace: $stackTrace\n");
    }
    return null;
  }

  @override
  Future<void> save(QuestionModel data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = jsonEncode(data.toJson());
      final ok = await prefs.setString(_dataKey, json);
      if (ok) {
        Logger.log("QuestionsCacheManager: Data saved successfully!");
      } else {
        Logger.log("QuestionsCacheManager: Could not save data!");
      }
    } catch (e, stackTrace) {
      Logger.log(
        'QuestionsCacheManager: Failed to save data!\n'
        'Error: $e\n'
        'StackTrace: $stackTrace',
      );
    }
  }
}
