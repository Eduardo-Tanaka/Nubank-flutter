import 'dart:convert';

class AjudaParams {
  final String title;
  final String jsonFile;
  final String route;

  AjudaParams({
    required this.title,
    required this.jsonFile,
    required this.route,
  });

  AjudaParams copyWith({
    String? title,
    String? jsonFile,
    String? route,
  }) {
    return AjudaParams(
      title: title ?? this.title,
      jsonFile: jsonFile ?? this.jsonFile,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'jsonFile': jsonFile,
      'route': route,
    };
  }

  factory AjudaParams.fromMap(Map<String, dynamic> map) {
    return AjudaParams(
      title: map['title'],
      jsonFile: map['jsonFile'],
      route: map['route'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AjudaParams.fromJson(String source) =>
      AjudaParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'AjudaParams(title: $title, jsonFile: $jsonFile, route: $route)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AjudaParams &&
        other.title == title &&
        other.jsonFile == jsonFile &&
        other.route == route;
  }

  @override
  int get hashCode => title.hashCode ^ jsonFile.hashCode ^ route.hashCode;
}
