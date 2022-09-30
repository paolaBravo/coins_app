import 'package:coins_app/core/utility/local_storage.dart';
import 'package:coins_app/dependency_injection/injector.dart';
import 'package:coins_app/features/data/models/coin_model.dart';
import 'package:coins_app/features/domain/entities/coin_entity.dart';
import 'package:coins_app/features/domain/usecases/get_coins_by_name.dart';
import 'package:coins_app/features/domain/usecases/get_coins_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCoinsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final getCoins = Injector.resolve<GetCoinsInformation>();
  final getCoinsByName = Injector.resolve<GetCoinsByName>();
  RxList<CoinEntityItem> coins = <CoinEntityItem>[].obs;
  int page = 1;
  RxBool isFirtsLoading = true.obs;
  RxBool hasNextPage = true.obs;
  final int limitItems = 15;
  RxBool isLoadingMore = false.obs;
  ScrollController scrollControllerCoinsPage = ScrollController();
  ScrollController scrollControllerComparePage = ScrollController();
  List<String> favorites = [];
  RxList<CoinEntityItem> coinsFavorites = <CoinEntityItem>[].obs;
  RxList<CoinEntityItem> selectedCoins = <CoinEntityItem>[].obs;
  RxInt maxSelectedCoins = 2.obs;
  RxInt currentSelectedCoins = 0.obs;
  List<String> filterOptionsList = ["Desc. price", "Asc. price"];
  var dropDown = "".obs;
  var filterOption = "".obs;
  final searchController = TextEditingController();
  RxString search = "".obs;

  @override
  Future<void> onInit() async {
    dropDown.value = filterOptionsList.first;
    filterOption.value = "desc";
    await getAllCoins(page, limitItems, filterOption.value);
    scrollControllerCoinsPage = ScrollController()
      ..addListener(() {
        loadMoreCoins();
      });
    scrollControllerComparePage = ScrollController()
      ..addListener(() {
        loadMoreCoins();
      });
    isFirtsLoading.value = false;
    super.onInit();
  }

  getAllCoins(int page, int limitItems, String filter) async {
    favorites = await LocalStorage.fetchFavoritesCoins();
    if (searchController.text == "") {
      var response = await getCoins.call(
          Params(limit: limitItems, page: page, filter: filterOption.value));
      response.fold((l) => null, (r) {
        if (r.isNotEmpty) {
          for (var coin in r) {
            favorites.contains(coin.id) == true
                ? coin.isFavorite = true
                : coin.isFavorite = false;
          }
          coins.addAll(r);
        } else {
          hasNextPage.value = false;
        }
      });
    } else {
      var response =
          await getCoinsByName.call(Param(name: searchController.text));
      response.fold((l) => null, (r) {
        if (r.isNotEmpty) {
          for (var coin in r) {
            favorites.contains(coin.id) == true
                ? coin.isFavorite = true
                : coin.isFavorite = false;
          }
          coins.addAll(r);
        } else {
          hasNextPage.value = false;
        }
      });
    }
  }

  changeFilterOption() async {
    if (dropDown.value == "Desc. price") {
      filterOption.value = "desc";
    } else {
      filterOption.value = "asc";
    }
    isFirtsLoading = true.obs;
    page = 1;
    coins.clear();
    await getAllCoins(page, limitItems, filterOption.value);
    isFirtsLoading.value = false;
  }

  searchCoins() async {
    search.value = searchController.text;
    isFirtsLoading = true.obs;
    page = 1;
    coins.clear();

    await getAllCoins(page, limitItems, filterOption.value);
    isFirtsLoading.value = false;
  }

  clearSearch() {
    searchController.clear();
    search.value = "";
    changeFilterOption();
  }

  loadMoreCoins() async {
    if (hasNextPage.value == true &&
        isFirtsLoading.value == false &&
        isLoadingMore.value == false &&
        (scrollControllerCoinsPage.position.extentAfter < 300 ||
            scrollControllerComparePage.position.extentAfter < 300) &&
        search.value == "") {
      isLoadingMore.value = true;
      page += 1;
      await getAllCoins(page, limitItems, filterOption.value);
      isLoadingMore.value = false;
    }
  }

  Future<void> addNewFavoriteCoin(CoinEntityItem item) async {
    int indexOfCoin = coins.indexOf(item);
    coins[indexOfCoin].isFavorite = true;
    await LocalStorage.addFavoriteCoin(item.id);
  }

  Future<void> removeAFavoriteCoin(CoinEntityItem item) async {
    int indexOfCrypto = coins.indexOf(item);
    coins[indexOfCrypto].isFavorite = false;
    await LocalStorage.removeFavoriteCoin(item.id);
    getAllFavoriteCoins();
  }

  Future<void> getAllFavoriteCoins() async {
    favorites = await LocalStorage.fetchFavoritesCoins();
    List<CoinEntityItem> temp = [];
    for (var element in favorites) {
      temp.add(coins.where((coin) => coin.id == element).first);
    }
    coinsFavorites.assignAll(temp);
  }

  void deselectCoin(int index) {
    if (currentSelectedCoins.value > 0 && coins[index].isSelected) {
      selectedCoins.remove(coins[index]);
      coins[index].isSelected = false;
      currentSelectedCoins.value -= 1;
      coins.refresh();
    }
  }

  void selectCoin(int index) {
    if (currentSelectedCoins.value < maxSelectedCoins.value &&
        !(coins[index].isSelected)) {
      coins[index].isSelected = true;
      selectedCoins.add(coins[index]);
      currentSelectedCoins.value += 1;
      coins.refresh();
    }
  }

  void resetSelection() {
    for (var element in selectedCoins) {
      element.isSelected = false;
    }
    selectedCoins.clear();
    coins.refresh();
    maxSelectedCoins.value = 2;
    currentSelectedCoins.value = 0;
  }

  searchByName() {}

  void logOut() async {
    await _auth.signOut();
    await LocalStorage.clearPreferences();
    Get.offAllNamed('/home');
  }
}
