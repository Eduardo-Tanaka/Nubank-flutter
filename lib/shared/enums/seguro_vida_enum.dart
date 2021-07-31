enum SeguroVidaEnum {
  FUNERAL_TITULAR,
  HOSPITALIZACAO,
  INVALIDEZ,
  FUNERAL_FAMILIAR_CONJUGE_FILHOS,
  FUNERAL_FAMILIAR_PAIS,
}

extension SeguroVidaEnumExtension on SeguroVidaEnum {
  String? get name {
    switch (this) {
      case SeguroVidaEnum.FUNERAL_TITULAR:
        return 'Assistência funeral do titular';
      case SeguroVidaEnum.HOSPITALIZACAO:
        return 'Hospitalização';
      case SeguroVidaEnum.INVALIDEZ:
        return 'Invalidez';
      case SeguroVidaEnum.FUNERAL_FAMILIAR_CONJUGE_FILHOS:
        return 'Assistência funeral de familiares';
      case SeguroVidaEnum.FUNERAL_FAMILIAR_PAIS:
        return 'Assistência funeral de familiares';
      default:
        return null;
    }
  }

  double? get value {
    switch (this) {
      case SeguroVidaEnum.FUNERAL_TITULAR:
        return 0;
      case SeguroVidaEnum.HOSPITALIZACAO:
        return 1.38;
      case SeguroVidaEnum.INVALIDEZ:
        return 2.63;
      case SeguroVidaEnum.FUNERAL_FAMILIAR_CONJUGE_FILHOS:
        return 1.07;
      case SeguroVidaEnum.FUNERAL_FAMILIAR_PAIS:
        return 12.34;
      default:
        return null;
    }
  }
}
