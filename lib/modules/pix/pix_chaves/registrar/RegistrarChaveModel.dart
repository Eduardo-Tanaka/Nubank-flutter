import 'package:flutter/material.dart';
import 'package:nubank/modules/pix/pix_chaves/enums/ChaveTipoEnum.dart';

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
