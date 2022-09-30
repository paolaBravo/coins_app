// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCore() {}
  @override
  void _configureCoinsFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<CoinRepository>(
          (c) => CoinRepositoryImpl(dataSource: c<CoinRemoteDataSource>()))
      ..registerFactory(
          (c) => GetCoinsInformation(repository: c<CoinRepository>()))
      ..registerFactory((c) => GetCoinsByName(repository: c<CoinRepository>()))
      ..registerFactory<CoinRemoteDataSource>(
          (c) => CoinRemoteDataSourceImpl());
  }
}
