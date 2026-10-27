import '../../../ifaces/string/plugins/cache_manager_iface.dart';
import '../../../ifaces/string/tools/cache_writer_iface.dart';

class CacheWriter implements CacheWriterIface {
  final CacheManagerIface cacheManager;

  CacheWriter({required this.cacheManager});

  @override
  Future<void> save(String data) async {
    await cacheManager.save(data);
  }
}
