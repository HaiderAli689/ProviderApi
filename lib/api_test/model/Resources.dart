import 'Data.dart';
import 'Support.dart';

class Resources {
  Resources({
      required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support,});

  factory Resources.fromJson(Map<String ,dynamic> json) => Resources(
      page: json['page'],
      perPage: json['perPage'],
      total: json['total'],
      totalPages: json['totalPages'],
      data: json['data'],
      support: json['support'] ,
  );

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;
  Support support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support.toJson();
    }
    return map;
  }

}