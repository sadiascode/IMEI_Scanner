import 'dart:typed_data';

abstract class ImageCacheManagerIface {
  Future<void> save(Uint8List data);

  Future<Uint8List?> read();

  Future<void> clear();
}
