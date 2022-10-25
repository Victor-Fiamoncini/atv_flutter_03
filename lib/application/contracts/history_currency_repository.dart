import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';

abstract class HistoryCurrencyRepository {
  Future<void> save(HistoryCurrencyEntity historyCurrency);

  Future<List<HistoryCurrencyEntity>> getAll();

  Future<void> deleteById(int id);
}
