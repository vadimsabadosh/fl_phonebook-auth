class ContactModel {
  String? id;
  String? name;
  String? number;

  ContactModel({this.id, this.name, this.number});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        number: json['number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number': number,
      };
}
