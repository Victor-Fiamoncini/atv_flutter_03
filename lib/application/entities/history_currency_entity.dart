import 'package:atv_flutter_03/application/entities/currency_entity.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';

class HistoryCurrencyEntity {
  final UserEntity user;
  final ConversionTypes fromConversionType;
  final ConversionTypes toConversionType;
  final String fromValue;
  final String toValue;

  const HistoryCurrencyEntity({
    required this.user,
    required this.fromConversionType,
    required this.toConversionType,
    required this.fromValue,
    required this.toValue,
  });
}
