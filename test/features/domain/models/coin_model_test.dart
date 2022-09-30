import 'dart:convert';

import 'package:coins_app/features/data/models/coin_model.dart';
import 'package:coins_app/features/domain/entities/coin_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final testCoinModel = CoinItemModel(
      currentPrice: 2.5,
      id: "test",
      image: "test_image",
      name: "test_name",
      symbol: "test_symbol");

  test(
    "should be a subclass of Coin entity",
    () async {
      expect(testCoinModel, isA<CoinEntityItem>());
    },
  );

  group("fromJson", () {
    test(
        "should return a valid model when the JSON number (current price) is a double",
        () {
      final Map<String, dynamic> jsonMap = json.decode(fixture("coin.json"));
      final result = CoinItemModel.fromJson(jsonMap);
      expect(result, testCoinModel);
    });

    test(
        "should return a valid model when the JSON number (current price) is a integer",
        () {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("coin_integer.json"));
      final result = CoinItemModel.fromJson(jsonMap);
      expect(result, testCoinModel);
    });
  });

  group("toJson", () {
    test("should return Json map containig the proper data", () {
      final result = testCoinModel.toJson();
      final expectedData = {
        "id": "test",
        "symbol": "test_symbol",
        "name": "test_name",
        "image": "test_image",
        "current_price": 2.5,
      };
      expect(result, expectedData);
    });
  });
}
