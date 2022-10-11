class UserEntity {
  final String name;
  final String email;

  const UserEntity({required this.name, required this.email});

  Map toJson() => {'name': name, 'email': email};
}
