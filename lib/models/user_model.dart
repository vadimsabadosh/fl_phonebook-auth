// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? name;
  String? email;

  UserModel({this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  @override
  String toString() => 'UserModel(name: $name, email: $email)';
}
