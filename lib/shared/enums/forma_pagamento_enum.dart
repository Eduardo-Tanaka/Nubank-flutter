enum FormaPagamentoEnum {
  CARTAO_CREDITO,
  CONTA_NUBANK,
}

extension FormaPagamentoEnumExtension on FormaPagamentoEnum {
  String? get value {
    switch (this) {
      case FormaPagamentoEnum.CARTAO_CREDITO:
        return 'Cartão de Crédito';
      case FormaPagamentoEnum.CONTA_NUBANK:
        return 'Conta Nubank';
      default:
        return null;
    }
  }
}
