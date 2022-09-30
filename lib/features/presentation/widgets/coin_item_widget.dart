import 'package:coins_app/features/data/models/coin_model.dart';
import 'package:flutter/material.dart';

class CoinItemWidget extends StatelessWidget {
  const CoinItemWidget(
      {Key? key,
      required this.coin,
      required this.changeFavorite,
      required this.pageFrom,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);
  final CoinItemModel coin;
  final String pageFrom;
  final Function(bool) changeFavorite;
  final Function onTap;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        selectedTileColor: Theme.of(context).highlightColor,
        onLongPress: () {
          onLongPress();
        },
        onTap: () {
          onTap();
        },
        selected: coin.isSelected,
        isThreeLine: true,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorLight,
              backgroundImage: NetworkImage(coin.image),
            ),
          ],
        ),
        title: Row(
          children: [
            Flexible(
              child: Text(
                coin.name,
                overflow: TextOverflow.ellipsis,
                style: coin.isSelected
                    ? Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Theme.of(context).primaryColorLight,
                        )
                    : Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
        subtitle: Text(
          coin.symbol + "\n" + coin.currentPrice.toString() + " USD",
        ),
        trailing: pageFrom != "compare"
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  coin.isFavorite == false
                      ? GestureDetector(
                          onTap: () {
                            changeFavorite(!coin.isFavorite);
                          },
                          child: const Icon(
                            Icons.star_border,
                            size: 35,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            changeFavorite(!coin.isFavorite);
                          },
                          child: pageFrom == "list"
                              ? Icon(
                                  Icons.star,
                                  size: 35,
                                  color: Theme.of(context).selectedRowColor,
                                )
                              : const Icon(
                                  Icons.delete,
                                  size: 35,
                                ),
                        ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
