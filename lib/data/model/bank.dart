class Bank {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromMap(Map<String, dynamic> map) => Bank(
    cardExpire: map['cardExpire'] as String?,
    cardNumber: map['cardNumber'] as String?,
    cardType: map['cardType'] as String?,
    currency: map['currency'] as String?,
    iban: map['iban'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'cardExpire': cardExpire,
    'cardNumber': cardNumber,
    'cardType': cardType,
    'currency': currency,
    'iban': iban,
  };
}
