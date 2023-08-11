import 'Address.dart';

class Data {
  Data({
       this.id,
       this.firstname,
       this.lastname,
       this.email,
       this.phone,
       this.birthday,
       this.gender,
       this.address,
       this.website,
       this.image,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    address = (json['address'] != null ? Address.fromJson(json['address']) : null)!;
    website = json['website'];
    image = json['image'];
  }
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? birthday;
  String? gender;
  Address? address;
  String? website;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['email'] = email;
    map['phone'] = phone;
    map['birthday'] = birthday;
    map['gender'] = gender;
    if (address != null) {
      map['address'] = address!.toJson();
    }
    map['website'] = website;
    map['image'] = image;
    return map;
  }

}