class User {
  String? name;
  String? city;

  User({this.name, this.city});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}