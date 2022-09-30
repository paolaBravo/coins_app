import 'package:coins_app/features/data/datasources/coin_remote_data_source.dart';
import 'package:coins_app/features/data/repositories/coin_repository_impl.dart';
import 'package:coins_app/features/domain/repositories/coin_repository.dart';
import 'package:coins_app/features/domain/usecases/get_coins_by_name.dart';
import 'package:coins_app/features/domain/usecases/get_coins_information.dart';
import 'package:kiwi/kiwi.dart';
part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
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

  static final resolve = container.resolve;

  void _configure() {
    _configureCore();
    _configureCoinModule();
  }

  void _configureCore();

  void _configureCoinModule() {
    _configureCoinsFactories;
  }

  @Register.factory(CoinRepository, from: CoinRepositoryImpl)
  @Register.factory(GetCoinsInformation)
  @Register.factory(GetCoinsByName)
  @Register.factory(CoinRemoteDataSource, from: CoinRemoteDataSourceImpl)
  void _configureCoinsFactories();
}
