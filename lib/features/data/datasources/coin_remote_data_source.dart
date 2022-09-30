import 'dart:convert';
import 'package:coins_app/core/error/failures.dart';
import 'package:coins_app/features/data/models/coin_model.dart';
import 'package:http/http.dart' as http;

abstract class CoinRemoteDataSource {
  Future<List<CoinItemModel>> getCoinsInformation(
      int page, int limitItems, String filter);
  Future<List<CoinItemModel>> getCoinsByName(String name);
}

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client = http.Client();

  @override
  Future<List<CoinItemModel>> getCoinsInformation(
      int page, int limitItems, String filter) async {
    Uri requestPath = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=price_$filter&per_page=$limitItems&page=$page&sparkline=false");
    final response = await http.get(requestPath);
    List jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      var result =
          jsonResponse.map((coin) => CoinItemModel.fromJson(coin)).toList();
      return result;
    } else {
      throw GeneralFailure(jsonResponse.toString());
    }
  }

  @override
  Future<List<CoinItemModel>> getCoinsByName(String name) async {
    Uri requestPath =
        Uri.parse("https://api.coingecko.com/api/v3/search?query=$name");
    final response = await http.get(requestPath);
    var a = json.decode(response.body);
    List jsonResponse = a["coins"];

    if (response.statusCode == 200) {
      var result =
          jsonResponse.map((coin) => CoinItemModel.fromJson(coin)).toList();

      var ids = "";
      for (var element in jsonResponse) {
        ids += element["id"] + ",";
      }
      for (var i = 0; i < result.length; i++) {
        result[i].image = jsonResponse[i]["large"];
      }

      Uri requestPathByPrice = Uri.parse(
          "https://api.coingecko.com/api/v3/simple/price?ids=$ids&vs_currencies=usd");
      final responsePrices = await http.get(requestPathByPrice);
      Map<String, dynamic> map = json.decode(responsePrices.body);
      map.forEach((key, value) {
        for (var element in result) {
          if (element.id == key) {
            element.currentPrice = double.parse(value["usd"].toString());
          }
        }
      });
      return result;
    } else {
      throw GeneralFailure(jsonResponse.toString());
    }
  }
}
