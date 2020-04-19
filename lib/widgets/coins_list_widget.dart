import 'package:flutter/material.dart';
import 'package:crypto_bloc/models/coin_model.dart';

class CoinsList extends StatelessWidget {
  final List<Coin> coins;

  const CoinsList({Key key, this.coins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: coins.length,
        itemBuilder: (BuildContext context, int i) {
          final coin = coins[i];
          return ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${++i}',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            title: Text(
              coin.fullName,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              coin.name,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            trailing: Text(
              '\$${coin.price.toStringAsFixed(4)}',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
