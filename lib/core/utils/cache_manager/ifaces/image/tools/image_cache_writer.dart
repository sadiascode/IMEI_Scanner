import 'dart:typed_data';

abstract class ImageCacheWriterIface {
  Future<void> save(Uint8List data);
}
