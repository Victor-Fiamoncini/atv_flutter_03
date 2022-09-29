import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';

class MemoryHistoryCurrencyRepository extends HistoryCurrencyRepository {
  final List<HistoryCurrencyEntity> currencies = [];

  @override
  Future<List<HistoryCurrencyEntity>> getAll() async => currencies;

  @override
  Future<void> save(HistoryCurrencyEntity historyCurrency) async {
    currencies.add(historyCurrency);
  }
}
