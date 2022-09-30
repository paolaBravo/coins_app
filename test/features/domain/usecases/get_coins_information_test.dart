//import 'package:coins_app/features/domain/entities/coin_entity.dart';
//import 'package:coins_app/features/domain/repositories/coin_repository.dart';
//import 'package:coins_app/features/domain/usecases/get_coins_information.dart';
//import 'package:dartz/dartz.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';

//class MockCoinRepository extends Mock implements CoinRepository {}

//void main() {
  // late MockCoinRepository mockCoinRepository;
  // late GetCoinsInformation usecase;

  // setUp(() {
  //   mockCoinRepository = MockCoinRepository();
  //   usecase = GetCoinsInformation(repository: mockCoinRepository);
  // });

  // const page = 1;
  // const limitItems = 2;
  // const filter = "desc";
  // var coin1 = CoinEntityItem(
  //     id: "aave-amm-uniwbtcusdc",
  //     symbol: "aammuniwbtcusdc",
  //     name: "Aave AMM UniWBTCUSDC",
  //     image:
  //         "https://assets.coingecko.com/coins/images/17255/large/aAmmUniWBTCUSDC.png?1626956709",
  //     currentPrice: 36642765919048.0,
  //     isFavorite: false,
  //     isSelected: false);
  // var coin2 = CoinEntityItem(
  //     id: "aave-amm-uniwbtcweth",
  //     symbol: "aammuniwbtcweth",
  //     name: "Aave AMM UniWBTCWETH",
  //     image:
  //         "https://assets.coingecko.com/coins/images/17231/large/aAmmUniWBTCWETH.png?1626921113",
  //     currentPrice: 1252261491.0,
  //     isFavorite: false,
  //     isSelected: false);
  // final List<CoinEntityItem> listOfCoins = [coin1, coin2];

  // test("should get coins information from repository", () async {
  //   when(mockCoinRepository
  //       .getCoinsInformation(page, limitItems, filter)
  //       .then((value) async => Right(listOfCoins)));

  //   final result =
  //       await usecase(Params(limit: limitItems, page: page, filter: filter));
  //   expect(result, listOfCoins);
  //   verify(mockCoinRepository.getCoinsInformation(page, limitItems, filter));
  //   verifyNoMoreInteractions(mockCoinRepository);
  // }
  // );
//}
