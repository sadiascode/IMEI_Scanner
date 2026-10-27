import '../../../ifaces/string/tools/cache_cleaner_iface.dart';
import '../../../ifaces/string/plugins/cache_manager_iface.dart';
import '../plugins/auth_session_cache_manager.dart';
import '../plugins/auth_token_cache_manager.dart';
import '../plugins/customer_name_cache_manager.dart';
import '../plugins/loan_account_cache_manager.dart';

class CacheCleaner implements CacheCleanerIface {
  final List<CacheManagerIface> cacheManagers;

  CacheCleaner({required this.cacheManagers});

  @override
  Future<void> clear() async {
    for (final cacheManager in cacheManagers) {
      await cacheManager.clear();
    }
  }

  Future<void> wipe() async {
    List<CacheManagerIface> cacheManagers = _CacheManaherList().getList();
    for (final cacheManager in cacheManagers) {
      await cacheManager.clear();
    }
  }
}

class _CacheManaherList {
  List<CacheManagerIface> getList() {
    return [
      AuthTokenCacheManager(),
      AuthSessionCacheManager(),
      CustomerNameCacheManager(),
      LoanAccountCacheManager(),
    ];
  }
}
