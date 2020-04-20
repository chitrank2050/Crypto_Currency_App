import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto_bloc/widgets/Error_widget.dart';
import 'package:crypto_bloc/widgets/coins_list_widget.dart';
import 'package:crypto_bloc/blocs/crypto/crypto_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Coins'),
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (BuildContext context, CryptoState state) {
          return Container(
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
            child: _buildBody(state),
          );
        },
      ),
    );
  }

  _buildBody(CryptoState state) {
    if (state is CryptoLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      );
    } else if (state is CryptoLoaded) {
      return CoinsList(
        coins: state.coins,
      );
    } else if (state is CryptoError) {
      return ShowError('Check Error');
    }
  }
}
