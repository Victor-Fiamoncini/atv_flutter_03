import 'package:atv_flutter_03/application/entities/currency_entity.dart';

abstract class CurrencyRepository {
  Future<void> save(CurrencyEntity currency);

  Future<List<CurrencyEntity>> getAll();
}
