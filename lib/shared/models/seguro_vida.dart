import 'package:nubank/shared/enums/forma_pagamento_enum.dart';
import 'package:nubank/shared/enums/seguro_vida_enum.dart';

class SeguroVida {
  final double valorTotal;
  final double cobertura;
  // enum
  final List<SeguroVidaEnum> seguros;
  // enum
  final FormaPagamentoEnum? formaPagamento;

  SeguroVida({
    required this.valorTotal,
    required this.cobertura,
    required this.seguros,
    required this.formaPagamento,
  });

  SeguroVida copyWith({
    double? valorTotal,
    double? cobertura,
    List<SeguroVidaEnum>? seguros,
    FormaPagamentoEnum? formaPagamento,
  }) {
    return SeguroVida(
      valorTotal: valorTotal ?? this.valorTotal,
      cobertura: cobertura ?? this.cobertura,
      seguros: seguros ?? this.seguros,
      formaPagamento: formaPagamento ?? this.formaPagamento,
    );
  }
}
