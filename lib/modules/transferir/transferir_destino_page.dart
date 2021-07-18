import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class TransferirDestinoPage extends StatefulWidget {
  const TransferirDestinoPage({Key? key}) : super(key: key);

  @override
  _TransferirDestinoPageState createState() => _TransferirDestinoPageState();
}

class _TransferirDestinoPageState extends State<TransferirDestinoPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );
  final textController = TextEditingController();
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await Permission.contacts.status;
    setState(() {
      _permissionStatus = status;
    });

    if (!status.isGranted && !status.isPermanentlyDenied) {
      requestPermission(Permission.contacts);
    }
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as double;
    moneyInputTextController.text = args.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Para quem você quer transferir ${moneyInputTextController.text}?",
                    style: TextStyles.textBigBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 32,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Encontre um contato ",
                            style: TextStyles.textBlack,
                          ),
                          TextSpan(
                            text: "na sua lista ou inicie uma ",
                          ),
                          TextSpan(
                            text: "nova transferência",
                            style: TextStyles.textBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InputTextWidget(
                    autoFocus: false,
                    onChanged: (String value) {
                      setState(() {});
                    },
                    textInputType: TextInputType.text,
                    controller: textController,
                    hint: "Nome, CPF/CNPJ ou chave Pix",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      bottom: 16,
                    ),
                    child: Text("Todos os contatos"),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: _permissionStatus.isGranted
                  ? ContactsService.getContacts(withThumbnails: false)
                  : null,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var contacts = snapshot.data as Iterable<Contact>;
                  var lcontacts = contacts.toList();
                  return Container(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: contacts.length + 1,
                      itemBuilder: (context, position) {
                        if (position == lcontacts.length) {
                          return Divider(
                            height: 0.4,
                          );
                        } else {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple[100],
                              child: Text(
                                lcontacts[position].givenName![0] +
                                    (lcontacts[position].familyName == null
                                        ? ""
                                        : lcontacts[position].familyName![0]),
                                style: TextStyles.textNuBold,
                              ),
                            ),
                            title: Text(
                              lcontacts[position].displayName ?? "",
                              style: TextStyles.textBold,
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, position) {
                        return Divider(
                          height: 1,
                          thickness: 1,
                        );
                      },
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
