import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> addFavoriteCoin(String coin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> favorites = sharedPreferences.getStringList("favorites") ?? [];
    favorites.add(coin);
    return await sharedPreferences.setStringList("favorites", favorites);
  }

  static Future<bool> removeFavoriteCoin(String coin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> favorites = sharedPreferences.getStringList("favorites") ?? [];
    favorites.remove(coin);
    return await sharedPreferences.setStringList("favorites", favorites);
  }

  static Future<List<String>> fetchFavoritesCoins() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList("favorites") ?? [];
  }

  static Future<void> clearPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("favorites");
  }
}
