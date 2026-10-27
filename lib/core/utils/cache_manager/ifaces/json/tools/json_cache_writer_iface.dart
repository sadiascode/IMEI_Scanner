abstract class JsonCacheWriterIface<T> {
  Future<void> save(T data);
}
