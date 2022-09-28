import 'package:atv_flutter_03/application/contracts/currency_repository.dart';
import 'package:atv_flutter_03/application/entities/currency_entity.dart';

class MemoryCurrencyRepository extends CurrencyRepository {
  final List<CurrencyEntity> currencies = [];

  @override
  Future<List<CurrencyEntity>> getAll() async => currencies;

  @override
  Future<void> save(CurrencyEntity currency) async {
    currencies.add(currency);
  }
}
