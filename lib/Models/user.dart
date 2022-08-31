class User {
  int? id;
  String? guid;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? role;

  User(
      {this.id,
      this.guid,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['guid'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['role'] = this.role;
    return data;
  }
}
