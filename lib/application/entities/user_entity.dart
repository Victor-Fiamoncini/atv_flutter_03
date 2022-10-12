class UserEntity {
  final String name;
  final String email;

  const UserEntity({required this.name, required this.email});

  Map toMap() => {'name': name, 'email': email};
}
