import 'package:equatable/equatable.dart';

class CoinEntityItem extends Equatable {
  final String id;
  final String symbol;
  final String name;
  late String image;
  late double currentPrice;
  bool isFavorite = false;
  bool isSelected = false;

  CoinEntityItem(
      {required this.currentPrice,
      required this.id,
      required this.image,
      required this.name,
      required this.symbol,
      this.isFavorite = false,
      this.isSelected = false});

  @override
  List<Object?> get props => [];
}
