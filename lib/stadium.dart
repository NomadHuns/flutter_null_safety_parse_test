import 'package:different_type_parse/source_file.dart';

class Stadium {
  final int id;
  final String name;
  final SourceFile sourceFile;
  final String? sport;
  final int? price;

  Stadium({
    required this.id,
    required this.name,
    required this.sourceFile,
    this.sport,
    this.price,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sourceFile'] = sourceFile;
    return data;
  }

  factory Stadium.fromJson(Map<String, dynamic> json) {
    return Stadium(
      id: json['id'],
      name: json['name'],
      sourceFile: SourceFile.fromJson(json['sourceFile']),
      sport: json['sport'],
      price: json['price'],
    );
  }

}