import 'package:coins_app/features/presentation/controllers/list_coins_controller.dart';
import 'package:coins_app/features/presentation/widgets/coin_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FavoritePage extends StatelessWidget {
  final ListCoinsController _controller = Get.put(ListCoinsController());

  FavoritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: const Key("FavoritePage"),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FAVORITE'),
            actions: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.logout),
                ),
                onTap: () {
                  _controller.logOut();
                },
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Your Favorite Coins",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                favoriteCoinsList(),
              ],
            ),
          ),
        ),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction != 0.0) {
            _controller.getAllFavoriteCoins();
          }
        });
  }

  Widget favoriteCoinsList() {
    return Obx(() {
      if (_controller.coinsFavorites.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            itemCount: _controller.coinsFavorites.length,
            itemBuilder: (context, index) {
              return CoinItemWidget(
                  coin: _controller.coinsFavorites[index],
                  changeFavorite: (bool status) {
                    if (status == true) {
                      _controller.addNewFavoriteCoin(
                          _controller.coinsFavorites[index]);
                      _controller.coinsFavorites.refresh();
                    } else {
                      _controller.removeAFavoriteCoin(
                          _controller.coinsFavorites[index]);
                      _controller.coinsFavorites.refresh();
                    }
                  },
                  onLongPress: () {},
                  onTap: () {},
                  pageFrom: "favorite");
            },
          ),
        );
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Image(
                  image: const AssetImage("assets/logo.png"),
                  width: Get.width * 0.4),
              SizedBox(
                height: Get.height * 0.05,
              ),
              const Text(
                "You don't have favorite coins, please go to the Coins option and select the star.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }
    });
  }
}
