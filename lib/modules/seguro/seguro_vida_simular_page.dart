import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

class SeguroVidaSimularPage extends StatefulWidget {
  const SeguroVidaSimularPage({Key? key}) : super(key: key);

  @override
  _SeguroVidaSimularPageState createState() => _SeguroVidaSimularPageState();
}

class _SeguroVidaSimularPageState extends State<SeguroVidaSimularPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        builder: (context) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  iconSize: 28,
                  splashRadius: 12,
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip: "FECHAR",
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Por que essa informação é importante?",
                        style: TextStyles.titleBlackBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 40,
                        ),
                        child: Text(
                          "Além da sua profissão ser importante na simulação, escolher a opção correta garante que você não tenha problemas para receber as coberturas contratadas caso precise.",
                          style: TextStyles.textGreyBold,
                        ),
                      ),
                      ButtonNuWidget(
                        text: "Continuar",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        textColor: Colors.black,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );

      _focus.addListener(_onFocusChange);
      copyProfissoes = profissoes;
      setState(() {});
    });
  }

  String? groupValue;
  List<String> profissoes = [
    "Administrador(a)",
    "Administrador(a) de ONG",
    "Advogado(a)",
    "Analista",
    "Aposentado(a)",
    "Arquiteto(a)",
    "Artesão(ã), Artista plástico(a)",
    "Assitente",
    "Assitente social",
    "Atendente",
    "Atleta",
    "Ator, Atriz",
    "Auditor(a)",
    "Autonômo(a) vinculado(a) a APP",
    "Auxiliar",
    "Bancário(a)",
    "Biomédico(a)",
    "Biólogo(a)",
    "Bombeiro(a), Salva-vidas",
    "Outro não especificado",
  ];
  List<String> copyProfissoes = [];
  FocusNode _focus = new FocusNode();
  void _onFocusChange() {
    visible = !visible;
    copyProfissoes = profissoes;
    setState(() {});
  }

  final textController = TextEditingController();
  bool visible = true;
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (visible) {
          Navigator.pop(
            context,
          );
        } else {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          textController.clear();
        }

        return false;
      },
      child: Scaffold(
        appBar: visible
            ? AppBarWidget(
                value: 0.2,
                linearProgressWidth: null,
                icon: Icons.navigate_before,
                showTrailingIcon: true,
                onPressedTrailing: () {
                  Navigator.pushNamed(
                    context,
                    "/ajuda_home",
                    arguments: AjudaParams(
                      title: "Seguro de vida",
                      jsonFile: "seguro_vida.json",
                    ),
                  );
                },
              )
            : null,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Visibility(
                visible: !visible,
                child: SizedBox(
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Visibility(
                      visible: visible,
                      child: Column(
                        children: [
                          Text(
                            "Qual é a sua atividade profissional?",
                            style: TextStyles.textBigBold,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Selecione sua profissão atual na lista abaixo. É importante selecionar a atividade correta, pois isso interfere na sua proposta e na validação do contrato.",
                              style: TextStyles.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: "Buscar \"comerciante\"",
                        fillColor: Colors.grey[200],
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.black54,
                          onPressed: () {
                            textController.clear();
                          },
                          splashColor: Colors.transparent,
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.chevron_left_outlined,
                          ),
                          color: Colors.black54,
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            textController.clear();
                          },
                          splashColor: Colors.transparent,
                        ),
                      ),
                      controller: textController,
                      focusNode: _focus,
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 300), () {
                          copyProfissoes = profissoes.where(
                            (element) {
                              return element.toLowerCase().contains(value);
                            },
                          ).toList();
                          if (copyProfissoes.isEmpty) {
                            copyProfissoes.add("Outro não especificado");
                          }
                          setState(() {});
                        });
                      },
                      onSubmitted: (value) {
                        textController.clear();
                      },
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: copyProfissoes.length,
                itemBuilder: (context, index) {
                  return RadioButtonWidget(
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    onTap: () {
                      setState(() {
                        groupValue = copyProfissoes[index];
                      });
                    },
                    groupValue: groupValue,
                    value: copyProfissoes[index],
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButtonWidget(
          onPressed: () {
            if (groupValue != null) {
              Navigator.pushNamed(
                context,
                "/recarga_resumo",
                arguments: groupValue,
              );
            }
          },
          value: groupValue,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
    _debounce?.cancel();
    textController.dispose();
  }
}
