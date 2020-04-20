import 'package:crypto_bloc/blocs/crypto/crypto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsList extends StatelessWidget {
  final CryptoLoaded state;
  final Function scrollNotif;
  final ScrollController controller;

  const CoinsList({Key key, this.state, this.scrollNotif, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).accentColor,
      onRefresh: () async {
        BlocProvider.of<CryptoBloc>(context).add(RefreshCoins());
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) => scrollNotif(notification, state),
        child: ListView.builder(
          controller: controller,
          itemCount: state.coins.length,
          itemBuilder: (BuildContext context, int i) {
            final coin = state.coins[i];
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
      ),
    );
  }
}
