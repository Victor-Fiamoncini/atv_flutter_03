import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/entities/currency_entity.dart';
import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';
import 'package:atv_flutter_03/infra/database/sqlite/sqlite_helper.dart';

class SqliteHistoryCurrencyRepository extends HistoryCurrencyRepository {
  @override
  Future<List<HistoryCurrencyEntity>> getAll() async {
    final database = await SqliteHelper().database;

    const sql = 'SELECT * FROM currency_history ORDER BY id DESC';
    final historyCurrencies = await database.rawQuery(sql);

    return historyCurrencies
        .map(
          (historyCurrencyRow) => HistoryCurrencyEntity(
            user: UserEntity(
              id: historyCurrencyRow['id'] as int,
              name: historyCurrencyRow['username'].toString(),
              email: historyCurrencyRow['email'].toString(),
            ),
            fromConversionType: ConversionTypes.values.singleWhere(
              (value) => value.name == historyCurrencyRow['from_currency'],
            ),
            toConversionType: ConversionTypes.values.singleWhere(
              (value) => value.name == historyCurrencyRow['to_currency'],
            ),
            fromValue: historyCurrencyRow['from_value'].toString(),
            toValue: historyCurrencyRow['to_value'].toString(),
          ),
        )
        .toList();
  }

  @override
  Future<void> save(HistoryCurrencyEntity historyCurrency) async {
    final database = await SqliteHelper().database;

    final mappedHistoryCurrency = {
      'username': historyCurrency.user.name.toString(),
      'email': historyCurrency.user.email.toString(),
      'from_currency': historyCurrency.fromConversionType.name,
      'to_currency': historyCurrency.toConversionType.name,
      'from_value': double.tryParse(historyCurrency.fromValue),
      'to_value': double.tryParse(historyCurrency.toValue),
    };

    await database.insert('currency_history', mappedHistoryCurrency);
  }

  @override
  Future<void> deleteById(int id) async {
    final database = await SqliteHelper().database;

    const sql = 'DELETE FROM currency_history WHERE id = ?';
    await database.rawDelete(sql, [id]);
  }
}
