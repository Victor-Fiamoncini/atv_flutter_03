import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';

class MemoryHistoryCurrencyRepository extends HistoryCurrencyRepository {
  final List<HistoryCurrencyEntity> _currencies = [];

  @override
  Future<List<HistoryCurrencyEntity>> getAll() async {
    return _currencies.reversed.toList();
  }

  @override
  Future<void> save(HistoryCurrencyEntity historyCurrency) async {
    _currencies.add(historyCurrency);
  }

  @override
  Future<void> deleteById(int id) {
    throw UnimplementedError();
  }
}
