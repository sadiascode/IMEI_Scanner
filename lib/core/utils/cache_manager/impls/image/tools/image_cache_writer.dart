import 'dart:typed_data';

import '../../../ifaces/image/plugins/image_cache_manager_iface.dart';
import '../../../ifaces/image/tools/image_cache_writer.dart';

class ImageCacheWriter implements ImageCacheWriterIface {
  final ImageCacheManagerIface cacheManager;

  ImageCacheWriter({required this.cacheManager});

  @override
  Future<void> save(Uint8List data) async {
    await cacheManager.save(data);
  }
}
