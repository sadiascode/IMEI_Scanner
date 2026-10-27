import 'dart:typed_data';

import '../../../ifaces/image/plugins/image_cache_manager_iface.dart';
import '../../../ifaces/image/tools/image_cache_reader.dart';

class ImageCacheReader implements ImageCacheReaderIface {
  final ImageCacheManagerIface cacheManager;

  ImageCacheReader({required this.cacheManager});

  @override
  Future<Uint8List?> read() async {
    return await cacheManager.read();
  }
}
