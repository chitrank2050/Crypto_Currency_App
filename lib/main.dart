import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto_bloc/screens/home_screen.dart';
import 'package:crypto_bloc/blocs/crypto/crypto_bloc.dart';
import 'package:crypto_bloc/repositories/crypto_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoBloc>(
      create: (BuildContext _) => CryptoBloc(
        cryptoRepository: CryptoRepository(),
      )..add(AppStarted()),
      child: MaterialApp(
        title: 'Flutter Crypto App',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.tealAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
