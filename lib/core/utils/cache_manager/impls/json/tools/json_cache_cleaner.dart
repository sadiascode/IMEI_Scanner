import '../../../ifaces/json/plugins/json_cache_manager_iface.dart';
import '../../../ifaces/json/tools/json_cache_cleaner_iface.dart';

class JsonCacheCleaner<T> implements JsonCacheCleanerIface<T> {
  final List<JsonCacheManagerIface<T>> cacheManagers;

  JsonCacheCleaner({required this.cacheManagers});

  @override
  Future<void> clear() async {
    for (final cacheManager in cacheManagers) {
      await cacheManager.clear();
    }
    // Use for concurrent cleaning only:
    // Do this only if concurrent operations are safe and desirable.
    // await Future.wait(
    //   cacheManagers.map((cacheManager) => cacheManager.clear()),
    // );
  }
}
