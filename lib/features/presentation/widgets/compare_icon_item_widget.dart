import 'package:coins_app/features/data/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompareIconItemWidget extends StatelessWidget {
  const CompareIconItemWidget({Key? key, required this.coin}) : super(key: key);
  final CoinItemModel coin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColorLight,
            backgroundImage: NetworkImage(coin.image),
            radius: 50,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            coin.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            coin.symbol,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: Get.height * 0.005),
          Text(
            coin.currentPrice.toString() + " USD",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
