class UserModel {
  String? name;
  String? email;

  UserModel({this.name, this.email});

  factory UserModel.init() {
    return UserModel();
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
