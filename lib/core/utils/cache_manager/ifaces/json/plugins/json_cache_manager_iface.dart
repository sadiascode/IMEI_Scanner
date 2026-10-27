abstract class JsonCacheManagerIface<T> {
  Future<void> save(T data);

  Future<T?> read();

  Future<void> clear();
}
