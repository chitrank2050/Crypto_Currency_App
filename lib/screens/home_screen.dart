import 'package:flutter/material.dart';

import 'package:crypto_bloc/widgets/Error_widget.dart';
import 'package:crypto_bloc/repositories/crypto_repository.dart';
import 'package:crypto_bloc/models/coin_model.dart';
import 'package:crypto_bloc/widgets/coins_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cryptoRepository = CryptoRepository();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Coins'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).primaryColor,
              Colors.grey[900],
            ],
          ),
        ),
        child: FutureBuilder(
          future: _cryptoRepository.getTopCoins(page: _page),
          builder: (BuildContext context, AsyncSnapshot snap) {
            switch (snap.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).accentColor),
                  ),
                );
              case ConnectionState.done:
                if (snap.hasError) return ShowError(snap);
                return CoinsList(coins: snap.data ?? <Coin>[]);
            }
            return null;
          },
        ),
      ),
    );
  }
}
