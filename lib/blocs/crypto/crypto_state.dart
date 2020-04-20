part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
  @override
  List<Object> get props => [];
}

// Initial State
class CryptoEmpty extends CryptoState {}

// Fetching Coins data
class CryptoLoading extends CryptoState {}

// Data fetched
class CryptoLoaded extends CryptoState {
  final List<Coin> coins;

  CryptoLoaded({this.coins});

  @override
  List<Object> get props => [coins];

  @override
  String toString() => 'CryptoLoaded {coins: $coins}';
}

// Error in API Response
class CryptoError extends CryptoState {}
