import '../../../ifaces/image/plugins/image_cache_manager_iface.dart';
import '../../../ifaces/image/tools/image_cache_cleaner.dart';

class ImageCacheCleaner implements ImageCacheCleanerIface {
  final List<ImageCacheManagerIface> cacheManagers;

  ImageCacheCleaner({required this.cacheManagers});

  @override
  Future<void> clear() async {
    for (final cacheManager in cacheManagers) {
      await cacheManager.clear();
    }
  }
}
