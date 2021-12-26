import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/shared/cubit/bool_cubit.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_regular/button_regular_widget.dart';
import 'package:nubank/shared/widgets/input_text/input_text_widget.dart';

class IndicarAmigosEmailPage extends StatelessWidget {
  const IndicarAmigosEmailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>(); //for storing form state.
    final emailController = TextEditingController();

    return BlocProvider(
      create: (_) => BoolCubit(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(
                TextSpan(
                  style: TextStyles.textTitle,
                  children: [
                    TextSpan(
                      text: "Qual o ",
                    ),
                    TextSpan(
                      text: "e-mail ",
                      style: TextStyles.textTitleBold,
                    ),
                    TextSpan(
                      text: "de quem você quer indicar?",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<BoolCubit, bool>(
                builder: (ctx, state) {
                  return Form(
                    key: _form,
                    child: InputTextWidget(
                      autoFocus: true,
                      onChanged: (String value) {
                        ctx
                            .read<BoolCubit>()
                            .change(_form.currentState!.validate());
                      },
                      textInputType: TextInputType.emailAddress,
                      validator: (text) {
                        if (!text!.contains("@")) {
                          return 'É isso mesmo?';
                        }
                        return null;
                      },
                      controller: emailController,
                      showDivider: false,
                      textStyle: TextStyles.textTitle,
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<BoolCubit, bool>(
              builder: (context, state) {
                return ButtonRegularWidget(
                  text: "ENVIAR",
                  isEnabled: state,
                  onPressed: () {
                    if (state) {
                      // enviar email
                      print(emailController.text);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
