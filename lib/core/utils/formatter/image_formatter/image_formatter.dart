import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ImageFormatter {
  static Future<String> xFileToBase64(XFile file) async {
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }

  static Future<XFile> base64ToXFile(String base64String) async {
    String fileName = 'image.jpg';
    String mimeType = 'image/jpeg';

    final cleanedBase64 = base64String.contains(',')
        ? base64String.split(',').last
        : base64String;
    final Uint8List bytes = base64Decode(cleanedBase64);
    return XFile.fromData(bytes, name: fileName, mimeType: mimeType);
  }

  static Uint8List? decodeBase64Image(String? base64String) {
    if (base64String == null || base64String.isEmpty) return null;

    final trimmed = base64String.trim();
    if (trimmed.isEmpty) return null;

    try {
      // If backend sends data URL like: "data:image/png;base64,AAAA"
      final commaIndex = trimmed.indexOf(',');
      final pureBase64 = commaIndex != -1
          ? trimmed.substring(commaIndex + 1)
          : trimmed;

      return base64Decode(pureBase64);
    } catch (_) {
      return null;
    }
  }

  static XFile? uint8ListToXFile(Uint8List? bytes) {
    String fileName = 'image.jpg';
    String mimeType = 'image/jpeg';

    if (bytes == null || bytes.isEmpty) {
      return null;
    }
    return XFile.fromData(bytes, name: fileName, mimeType: mimeType);
  }
}
