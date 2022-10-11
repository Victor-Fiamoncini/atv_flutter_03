import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';

class MemoryHistoryCurrencyRepository extends HistoryCurrencyRepository {
  final List<HistoryCurrencyEntity> _currencies = [];

  @override
  Future<List<HistoryCurrencyEntity>> getAll() async => _currencies;

  @override
  Future<void> save(HistoryCurrencyEntity historyCurrency) async {
    _currencies.add(historyCurrency);
  }
}
