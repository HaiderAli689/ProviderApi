class Address {
  Address({
      required this.id,
      required this.street,
      required this.streetName,
      required this.buildingNumber,
      required this.city,
      required this.zipcode,
      required this.country,
      required this.countyCode,
      required this.latitude,
      required this.longitude,});

  factory Address.fromJson(dynamic json) => Address(
    id : json['id'],
    street : json['street'],
    streetName : json['streetName'],
    buildingNumber : json['buildingNumber'],
    city : json['city'],
    zipcode : json['zipcode'],
    country : json['country'],
    countyCode : json['county_code'],
    latitude : json['latitude'],
    longitude : json['longitude'],
  );
  int id;
  String street;
  String streetName;
  String buildingNumber;
  String city;
  String zipcode;
  String country;
  String countyCode;
  double latitude;
  double longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['street'] = street;
    map['streetName'] = streetName;
    map['buildingNumber'] = buildingNumber;
    map['city'] = city;
    map['zipcode'] = zipcode;
    map['country'] = country;
    map['county_code'] = countyCode;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}