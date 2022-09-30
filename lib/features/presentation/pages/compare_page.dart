import 'package:coins_app/features/presentation/controllers/list_coins_controller.dart';
import 'package:coins_app/features/presentation/widgets/button_widget.dart';
import 'package:coins_app/features/presentation/widgets/coin_item_widget.dart';
import 'package:coins_app/features/presentation/widgets/compare_icon_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComparePage extends StatelessWidget {
  ComparePage({Key? key}) : super(key: key);
  final ListCoinsController _controller = Get.put(ListCoinsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COMPARE'),
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
        child: Obx(
          () => listCompare(context),
        ),
      ),
    );
  }

  Widget listCompare(BuildContext context) {
    if (_controller.selectedCoins.length == 2) {
      return Column(
        children: [
          Text(
            "Compare prices",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CompareIconItemWidget(coin: _controller.selectedCoins[0]),
                  VerticalDivider(
                    color: Theme.of(context).primaryColorDark,
                    thickness: 1,
                  ),
                  CompareIconItemWidget(coin: _controller.selectedCoins[1])
                ],
              ),
            ),
          ),
          ButtonWidget(
            text: "Change options",
            onTap: () => _controller.resetSelection(),
          ),
        ],
      );
    } else {
      if (_controller.coins.isNotEmpty &&
          _controller.selectedCoins.length < 2) {
        return Column(
          children: [
            Text(
              "Compare prices",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            coinList(),
            Obx(
              () => _controller.isLoadingMore.value == true
                  ? const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        );
      }
      return Container();
    }
  }

  Widget coinList() {
    return Obx(
      () {
        return Expanded(
          child: ListView.builder(
            controller: _controller.scrollControllerComparePage,
            itemCount: _controller.coins.length,
            itemBuilder: (context, index) {
              return CoinItemWidget(
                coin: _controller.coins[index],
                pageFrom: "compare",
                changeFavorite: (bool status) {
                  if (status == true) {
                    _controller.addNewFavoriteCoin(_controller.coins[index]);
                    _controller.coins.refresh();
                  } else {
                    _controller.removeAFavoriteCoin(_controller.coins[index]);
                    _controller.coins.refresh();
                  }
                },
                onLongPress: () {
                  _controller.selectCoin(index);
                },
                onTap: () {
                  _controller.deselectCoin(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}
