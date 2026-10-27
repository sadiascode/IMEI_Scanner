import '../../../ifaces/json/plugins/json_cache_manager_iface.dart';
import '../../../ifaces/json/tools/json_cache_reader_iface.dart';

class JsonCacheReader<T> implements JsonCacheReaderIface<T> {
  final JsonCacheManagerIface cacheManager;

  JsonCacheReader({required this.cacheManager});

  @override
  Future<T?> read() async {
    return await cacheManager.read();
  }
}
