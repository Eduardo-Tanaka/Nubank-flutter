import 'dart:convert';

class Doacao {
  final String instituicao;
  final double valor;
  Doacao({
    required this.instituicao,
    required this.valor,
  });

  Doacao copyWith({
    String? instituicao,
    double? valor,
  }) {
    return Doacao(
      instituicao: instituicao ?? this.instituicao,
      valor: valor ?? this.valor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'instituicao': instituicao,
      'valor': valor,
    };
  }

  factory Doacao.fromMap(Map<String, dynamic> map) {
    return Doacao(
      instituicao: map['instituicao'],
      valor: map['valor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Doacao.fromJson(String source) => Doacao.fromMap(json.decode(source));

  @override
  String toString() => 'Doacao(instituicao: $instituicao, valor: $valor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doacao &&
        other.instituicao == instituicao &&
        other.valor == valor;
  }

  @override
  int get hashCode => instituicao.hashCode ^ valor.hashCode;
}
