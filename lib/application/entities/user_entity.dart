class UserEntity {
  final int? id;
  final String name;
  final String email;

  const UserEntity({this.id, required this.name, required this.email});

  Map toMap() => {'name': name, 'email': email};
}
