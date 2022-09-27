import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';

class MemoryUserRepository extends UserRepository {
  late UserEntity _user;

  @override
  Future<UserEntity> get currentUser async => _user;

  @override
  Future<void> save(UserEntity user) async {
    _user = user;
  }
}
