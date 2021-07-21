import 'package:flutter/material.dart';
import 'package:nubank/shared/enums/chave_tipo_enum.dart';

class RegistrarChaveModel {
  final ChaveTipoEnum type;
  final String? value;
  final IconData icon;

  RegistrarChaveModel({
    required this.type,
    required this.value,
    required this.icon,
  });
}
