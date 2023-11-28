class UserModel {
  final int? id;
  final String userName;
  final String name;
  final String address;
  final String password;

  UserModel({
    this.id,
    required this.userName,
    required this.name,
    required this.address,
    required this.password,
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
        id: json['_id'] as int?,
        userName: json['userName'] as String,
        name: json['name'] as String,
        address: (json['address']??"") as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'userName': userName,
      'name': name,
      'address': address,
      'password': password,
    };
  }

  UserModel copy({
    int? id,
    String? userName,
    String? name,
    String? address,
    String? password,
  }) =>
      UserModel(
          id: id ?? this.id,
          userName: userName ?? this.userName,
          name: name ?? this.name,
          address: address ?? this.address,
          password: password ?? this.password);

  @override
  String toString() {
    return 'id: $id, userName: $userName, fullName: $name, address: $address, password: $password';
  }
}
