import 'package:coins_app/features/domain/entities/coin_entity.dart';

class CoinItemModel extends CoinEntityItem {
  CoinItemModel({
    required double currentPrice,
    required String id,
    required String image,
    required String name,
    required String symbol,
  }) : super(
          currentPrice: currentPrice,
          id: id,
          image: image,
          name: name,
          symbol: symbol,
          isFavorite: false,
          isSelected: false,
        );

  factory CoinItemModel.fromJson(Map<String, dynamic> json) {
    return CoinItemModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'] == null ? "" : json['image'].toString(),
      currentPrice: json['current_price'] == null
          ? 0.0
          : double.parse(json['current_price'].toString()),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'image': image,
      'current_price': currentPrice,
    };
  }
}
