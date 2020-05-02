

class Employee {
  Address address;
  Company company;
  String email;
  int id;
  String name;
  String phone;
  String username;
  String website;

  Employee({this.address, this.company, this.email, this.id, this.name, this.phone, this.username, this.website});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      company: json['company'] != null ? Company.fromJson(json['company']) : null,
      email: json['email'],
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      username: json['username'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['website'] = this.website;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    return data;
  }
}

class Address {
  String city;
  Geo geo;
  String street;
  String suite;
  String zipcode;

  Address({this.city, this.geo, this.street, this.suite, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
      street: json['street'],
      suite: json['suite'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    return data;
  }
}

class Geo {
  String lat;
  String lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String bs;
  String catchPhrase;
  String name;

  Company({this.bs, this.catchPhrase, this.name});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      bs: json['bs'],
      catchPhrase: json['catchPhrase'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bs'] = this.bs;
    data['catchPhrase'] = this.catchPhrase;
    data['name'] = this.name;
    return data;
  }
}