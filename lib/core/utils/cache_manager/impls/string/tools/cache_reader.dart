// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../logger/logger.dart';
import '../../../ifaces/string/plugins/cache_manager_iface.dart';
import '../../../ifaces/string/tools/cache_reader_iface.dart';

// part "../plugins/token_cache_manager.dart";

class CacheReader implements CacheReaderIface {
  final CacheManagerIface cacheManager;

  CacheReader({required this.cacheManager});

  @override
  Future<String?> read() async {
    return await cacheManager.read();
  }
}
