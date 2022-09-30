import 'package:coins_app/features/presentation/controllers/list_coins_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/coin_item_widget.dart';

class CoinsPage extends StatelessWidget {
  CoinsPage({Key? key}) : super(key: key);
  final ListCoinsController _controller = Get.put(ListCoinsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COINS'),
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
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              color: Theme.of(context).primaryColorLight,
              child: Column(
                children: [
                  TextField(
                    style: Theme.of(context).textTheme.caption,
                    controller: _controller.searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: const EdgeInsets.all(8),
                      suffixIcon: InkWell(
                        child: const Icon(Icons.clear_rounded),
                        onTap: () {
                          _controller.clearSearch();
                        },
                      ),
                    ),
                    onSubmitted: (val) {
                      _controller.searchCoins();
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Crypto Info",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Obx(
                        (() => DropdownButton(
                              value: _controller.dropDown.value,
                              icon: const Icon(Icons.swap_vert_outlined),
                              onChanged: _controller.search.value != ""
                                  ? null
                                  : (String? value) {
                                      _controller.dropDown.value = value!;
                                      _controller.changeFilterOption();
                                    },
                              style: Theme.of(context).textTheme.bodyText1,
                              items: _controller.filterOptionsList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                ],
              ),
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
            Obx(() => _controller.hasNextPage.value == false
                ? Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Theme.of(context).selectedRowColor,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  )
                : const SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget coinList() {
    return Obx(
      () {
        if (_controller.coins.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              controller: _controller.scrollControllerCoinsPage,
              itemCount: _controller.coins.length,
              itemBuilder: (context, index) {
                return CoinItemWidget(
                  coin: _controller.coins[index],
                  pageFrom: "list",
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
