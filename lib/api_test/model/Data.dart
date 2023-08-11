class Data {
  Data({
      required this.id,
      required this.name,
      required this.year,
      required this.color,
      required this.pantoneValue,});

  factory Data.fromJson(dynamic json) => Data(
    id : json['id'],
    name : json['name'],
    year : json['year'],
    color : json['color'],
    pantoneValue : json['pantone_value'],
  );
  int id;
  String name;
  int year;
  String color;
  String pantoneValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['year'] = year;
    map['color'] = color;
    map['pantone_value'] = pantoneValue;
    return map;
  }

}