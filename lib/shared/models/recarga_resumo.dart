import 'dart:convert';

class RecargaResumo {
  final String numero;
  final String operadora;
  final String formaPagamento;
  final String data;

  RecargaResumo({
    required this.numero,
    required this.operadora,
    required this.formaPagamento,
    required this.data,
  });

  RecargaResumo copyWith({
    String? numero,
    String? operadora,
    String? formaPagamento,
    String? data,
  }) {
    return RecargaResumo(
      numero: numero ?? this.numero,
      operadora: operadora ?? this.operadora,
      formaPagamento: formaPagamento ?? this.formaPagamento,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numero': numero,
      'operadora': operadora,
      'formaPagamento': formaPagamento,
      'data': data,
    };
  }

  factory RecargaResumo.fromMap(Map<String, dynamic> map) {
    return RecargaResumo(
      numero: map['numero'],
      operadora: map['operadora'],
      formaPagamento: map['formaPagamento'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecargaResumo.fromJson(String source) =>
      RecargaResumo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecargaResumo(numero: $numero, operadora: $operadora, formaPagamento: $formaPagamento, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecargaResumo &&
        other.numero == numero &&
        other.operadora == operadora &&
        other.formaPagamento == formaPagamento &&
        other.data == data;
  }

  @override
  int get hashCode {
    return numero.hashCode ^
        operadora.hashCode ^
        formaPagamento.hashCode ^
        data.hashCode;
  }
}
