abstract class CacheManagerIface {
  Future<void> save(String data);

  Future<String?> read();

  Future<void> clear();
}
