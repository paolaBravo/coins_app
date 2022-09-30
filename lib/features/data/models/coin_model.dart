class CoinItemModel {
  late String id;
  late String symbol;
  late String name;
  String image = "";
  double currentPrice = 0;
  bool isFavorite = false;
  bool isSelected = false;

  CoinItemModel({
    required this.id,
    required this.symbol,
    required this.name,
  });

  CoinItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'] == null ? "" : json['image'].toString();
    currentPrice = json['current_price'] == null
        ? 0.0
        : double.parse(json['current_price'].toString());
  }
}
