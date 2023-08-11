import 'Data.dart';

class Persons {
  Persons({
      this.status,
      this.code,
      this.total,
      this.data,});

  Persons.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  int? code;
  int? total;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['total'] = total;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}