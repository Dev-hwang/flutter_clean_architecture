import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage.g.dart';

@riverpod
SecureStorage secureStorage(Ref ref) {
  return SecureStorageImpl();
}

abstract class SecureStorage {
  /// Reads the value with [key].
  Future<String?> read({required String key});

  /// Writes the [value] with [key].
  Future<void> write({required String key, required String value});

  /// Deletes the value with [key].
  Future<void> delete({required String key});
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<String?> read({required String key}) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> delete({required String key}) {
    return _storage.delete(key: key);
  }
}
