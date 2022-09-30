import 'package:equatable/equatable.dart';

class CoinEntityItem extends Equatable {
  final String id;
  final String symbol;
  final String name;
  late String image;
  late double currentPrice;
  bool isFavorite;
  bool isSelected;

  CoinEntityItem(
      {required this.currentPrice,
      required this.id,
      required this.image,
      required this.name,
      required this.symbol,
      required this.isFavorite,
      required this.isSelected});

  @override
  List<Object?> get props => [];
}
