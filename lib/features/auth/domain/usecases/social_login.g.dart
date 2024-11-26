// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socialLoginHash() => r'b8b57d5b01c1fa4de0cc10ae67f4dabd848bcd36';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [socialLogin].
@ProviderFor(socialLogin)
const socialLoginProvider = SocialLoginFamily();

/// See also [socialLogin].
class SocialLoginFamily
    extends Family<AsyncValue<Result<SocialLoginResult, CustomException>>> {
  /// See also [socialLogin].
  const SocialLoginFamily();

  /// See also [socialLogin].
  SocialLoginProvider call(
    SocialType socialType,
  ) {
    return SocialLoginProvider(
      socialType,
    );
  }

  @override
  SocialLoginProvider getProviderOverride(
    covariant SocialLoginProvider provider,
  ) {
    return call(
      provider.socialType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'socialLoginProvider';
}

/// See also [socialLogin].
class SocialLoginProvider extends AutoDisposeFutureProvider<
    Result<SocialLoginResult, CustomException>> {
  /// See also [socialLogin].
  SocialLoginProvider(
    SocialType socialType,
  ) : this._internal(
          (ref) => socialLogin(
            ref as SocialLoginRef,
            socialType,
          ),
          from: socialLoginProvider,
          name: r'socialLoginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$socialLoginHash,
          dependencies: SocialLoginFamily._dependencies,
          allTransitiveDependencies:
              SocialLoginFamily._allTransitiveDependencies,
          socialType: socialType,
        );

  SocialLoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.socialType,
  }) : super.internal();

  final SocialType socialType;

  @override
  Override overrideWith(
    FutureOr<Result<SocialLoginResult, CustomException>> Function(
            SocialLoginRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SocialLoginProvider._internal(
        (ref) => create(ref as SocialLoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        socialType: socialType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result<SocialLoginResult, CustomException>>
      createElement() {
    return _SocialLoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SocialLoginProvider && other.socialType == socialType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, socialType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SocialLoginRef on AutoDisposeFutureProviderRef<
    Result<SocialLoginResult, CustomException>> {
  /// The parameter `socialType` of this provider.
  SocialType get socialType;
}

class _SocialLoginProviderElement extends AutoDisposeFutureProviderElement<
    Result<SocialLoginResult, CustomException>> with SocialLoginRef {
  _SocialLoginProviderElement(super.provider);

  @override
  SocialType get socialType => (origin as SocialLoginProvider).socialType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
