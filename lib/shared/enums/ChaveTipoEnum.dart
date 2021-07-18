enum ChaveTipoEnum {
  CPF,
  EMAIL,
  TELEFONE,
  EVP,
}

extension ChaveTipoEnumExtension on ChaveTipoEnum {
  String? get value {
    switch (this) {
      case ChaveTipoEnum.CPF:
        return 'CPF';
      case ChaveTipoEnum.EMAIL:
        return 'E-mail';
      case ChaveTipoEnum.TELEFONE:
        return 'Celular';
      case ChaveTipoEnum.EVP:
        return 'Chave aleatória';
      default:
        return null;
    }
  }
}
