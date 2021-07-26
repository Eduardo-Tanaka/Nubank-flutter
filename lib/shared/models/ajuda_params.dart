import 'dart:convert';

class AjudaParams {
  final String title;
  final String jsonFile;

  AjudaParams({
    required this.title,
    required this.jsonFile,
  });

  AjudaParams copyWith({
    String? title,
    String? jsonFile,
    String? route,
  }) {
    return AjudaParams(
      title: title ?? this.title,
      jsonFile: jsonFile ?? this.jsonFile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'jsonFile': jsonFile,
    };
  }

  factory AjudaParams.fromMap(Map<String, dynamic> map) {
    return AjudaParams(
      title: map['title'],
      jsonFile: map['jsonFile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AjudaParams.fromJson(String source) =>
      AjudaParams.fromMap(json.decode(source));

  @override
  String toString() => 'AjudaParams(title: $title, jsonFile: $jsonFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AjudaParams &&
        other.title == title &&
        other.jsonFile == jsonFile;
  }

  @override
  int get hashCode => title.hashCode ^ jsonFile.hashCode;
}
