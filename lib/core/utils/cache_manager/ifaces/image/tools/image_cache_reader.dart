import 'dart:typed_data';

abstract class ImageCacheReaderIface {
  Future<Uint8List?> read();
}
