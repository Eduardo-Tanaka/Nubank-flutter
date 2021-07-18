import 'dart:convert';

class Ajuda {
  final String title;
  final String description;
  Ajuda({
    required this.title,
    required this.description,
  });

  Ajuda copyWith({
    String? title,
    String? description,
  }) {
    return Ajuda(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Ajuda.fromMap(Map<String, dynamic> map) {
    return Ajuda(
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ajuda.fromJson(String source) => Ajuda.fromMap(json.decode(source));

  @override
  String toString() => 'Ajuda(title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ajuda &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
