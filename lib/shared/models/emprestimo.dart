import 'dart:convert';

class Emprestimo {
  final String? tipo;
  final double? valor;
  final String? data;
  final int? parcelas;
  final String? objetivo;
  final bool edit;

  Emprestimo({
    this.tipo,
    this.valor,
    this.data,
    this.parcelas,
    this.objetivo,
    this.edit = false,
  });

  Emprestimo copyWith({
    String? tipo,
    double? valor,
    String? data,
    int? parcelas,
    String? objetivo,
    bool? edit,
  }) {
    return Emprestimo(
      tipo: tipo ?? this.tipo,
      valor: valor ?? this.valor,
      data: data ?? this.data,
      parcelas: parcelas ?? this.parcelas,
      objetivo: objetivo ?? this.objetivo,
      edit: edit ?? this.edit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'valor': valor,
      'data': data,
      'parcelas': parcelas,
      'objetivo': objetivo,
      'edit': edit,
    };
  }

  factory Emprestimo.fromMap(Map<String, dynamic> map) {
    return Emprestimo(
      tipo: map['tipo'],
      valor: map['valor'],
      data: map['data'],
      parcelas: map['parcelas'],
      objetivo: map['objetivo'],
      edit: map['edit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Emprestimo.fromJson(String source) =>
      Emprestimo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Emprestimo(tipo: $tipo, valor: $valor, data: $data, parcelas: $parcelas, objetivo: $objetivo, edit: $edit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Emprestimo &&
        other.tipo == tipo &&
        other.valor == valor &&
        other.data == data &&
        other.parcelas == parcelas &&
        other.objetivo == objetivo &&
        other.edit == edit;
  }

  @override
  int get hashCode {
    return tipo.hashCode ^
        valor.hashCode ^
        data.hashCode ^
        parcelas.hashCode ^
        objetivo.hashCode ^
        edit.hashCode;
  }
}
