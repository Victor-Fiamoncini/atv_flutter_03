class CurrencyEntity {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  const CurrencyEntity({
    required this.name,
    required this.real,
    required this.dolar,
    required this.euro,
    required this.bitcoin,
  });

  static List<CurrencyEntity> get currencies {
    return [
      const CurrencyEntity(
        name: 'Real',
        real: 1,
        dolar: 0.18,
        euro: 0.15,
        bitcoin: 0.000016,
      ),
      const CurrencyEntity(
        name: 'Dolar',
        real: 5.65,
        dolar: 1,
        euro: 0.85,
        bitcoin: 0.000088,
      ),
      const CurrencyEntity(
        name: 'Euro',
        real: 6.62,
        dolar: 1.17,
        euro: 1,
        bitcoin: 0.00010,
      ),
      const CurrencyEntity(
        name: 'Bitcoin',
        real: 64116.51,
        dolar: 11351.30,
        euro: 9689.54,
        bitcoin: 1,
      ),
    ];
  }
}
