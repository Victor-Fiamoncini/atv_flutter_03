import 'package:atv_flutter_03/application/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> save(UserEntity user);

  Future<UserEntity> get currentUser;
}
