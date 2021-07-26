import 'dart:convert';

class Ajuda {
  final String? superTitle;
  final String title;
  final String description;

  Ajuda({
    this.superTitle,
    required this.title,
    required this.description,
  });

  Ajuda copyWith({
    String? superTitle,
    String? title,
    String? description,
  }) {
    return Ajuda(
      superTitle: superTitle ?? this.superTitle,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'superTitle': superTitle,
      'title': title,
      'description': description,
    };
  }

  factory Ajuda.fromMap(Map<String, dynamic> map) {
    return Ajuda(
      superTitle: map['superTitle'],
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ajuda.fromJson(String source) => Ajuda.fromMap(json.decode(source));

  @override
  String toString() =>
      'Ajuda(superTitle: $superTitle, title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ajuda &&
        other.superTitle == superTitle &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode =>
      superTitle.hashCode ^ title.hashCode ^ description.hashCode;
}
