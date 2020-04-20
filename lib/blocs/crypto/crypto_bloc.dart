import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:crypto_bloc/repositories/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:crypto_bloc/models/coin_model.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository;

  CryptoBloc({@required CryptoRepository cryptoRepository})
      : assert(cryptoRepository != null),
        _cryptoRepository = cryptoRepository;

  @override
  CryptoState get initialState => CryptoEmpty();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is RefreshCoins) {
      yield* _getCoins(coins: []);
    } else if (event is LoadMoreCoins) {
      yield* _mapLoadMoreCoinsToState(event);
    }
  }

  Stream<CryptoState> _mapAppStartedToState() async* {
    yield CryptoLoading();
    yield* _getCoins(coins: []);
  }

  Stream<CryptoState> _getCoins({List<Coin> coins, int page = 0}) async* {
    // Request Coins
    try {
      List<Coin> newCoinsList =
          coins + await _cryptoRepository.getTopCoins(page: page);
      yield CryptoLoaded(coins: newCoinsList);
    } catch (e) {
      CryptoError();
    }
  }

  Stream<CryptoState> _mapLoadMoreCoinsToState(LoadMoreCoins event) async* {
    final int nextPage = event.coins.length ~/ CryptoRepository.prePage;
    yield* _getCoins(coins: event.coins, page: nextPage);
  }
}