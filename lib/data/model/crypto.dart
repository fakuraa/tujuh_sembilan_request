class Crypto {
  final String? coin;
  final String? wallet;
  final String? network;

  Crypto({this.coin, this.wallet, this.network});

  factory Crypto.fromMap(Map<String, dynamic> map) => Crypto(
    coin: map['coin'] as String?,
    wallet: map['wallet'] as String?,
    network: map['network'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'coin': coin,
    'wallet': wallet,
    'network': network,
  };
}
