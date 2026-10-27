import '../../../ifaces/json/plugins/json_cache_manager_iface.dart';
import '../../../ifaces/json/tools/json_cache_writer_iface.dart';

class JsonCacheWriter<T> implements JsonCacheWriterIface<T> {
  final JsonCacheManagerIface cacheManager;

  JsonCacheWriter({required this.cacheManager});

  @override
  Future<void> save(T data) async {
    await cacheManager.save(data);
  }
}
