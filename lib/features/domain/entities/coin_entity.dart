class CoinEntity {
  List<CoinEntityItem> coins;

  CoinEntity(this.coins);
}

class CoinEntityItem {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final int currentPrice;
  bool? isFavorite;

  CoinEntityItem(
      {required this.currentPrice,
      required this.id,
      required this.image,
      required this.name,
      required this.symbol,
      this.isFavorite});
}
