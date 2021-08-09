import 'dart:convert';

class MeusDados {
  final String type;
  final String editValue;

  MeusDados({
    required this.type,
    required this.editValue,
  });

  MeusDados copyWith({
    String? type,
    String? editValue,
  }) {
    return MeusDados(
      type: type ?? this.type,
      editValue: editValue ?? this.editValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'editValue': editValue,
    };
  }

  factory MeusDados.fromMap(Map<String, dynamic> map) {
    return MeusDados(
      type: map['type'],
      editValue: map['editValue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MeusDados.fromJson(String source) =>
      MeusDados.fromMap(json.decode(source));

  @override
  String toString() => 'MeusDados(type: $type, editValue: $editValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeusDados &&
        other.type == type &&
        other.editValue == editValue;
  }

  @override
  int get hashCode => type.hashCode ^ editValue.hashCode;
}
