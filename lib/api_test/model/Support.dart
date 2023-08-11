class Support {
  Support({
      required this.url,
      required this.text,});

  factory Support.fromJson(dynamic json) => Support(
    url : json['url'],
    text : json['text'],
  );
  String url;
  String text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;
    return map;
  }

}