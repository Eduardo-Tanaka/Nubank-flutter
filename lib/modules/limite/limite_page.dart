import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'dart:ui' as ui;

class LimitePage extends StatefulWidget {
  const LimitePage({Key? key}) : super(key: key);

  @override
  _LimitePageState createState() => _LimitePageState();
}

class _LimitePageState extends State<LimitePage> {
  double limite = 30000;
  final double gasto = 5000;
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );
  final moneyInputDisponivelTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );

  ui.Image? customImage;
  ui.Image? customImage2;

  Future<ui.Image> load(String asset, int width, int height) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
      targetHeight: height,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void initState() {
    super.initState();
    moneyInputTextController.text = limite.toString();
    moneyInputDisponivelTextController.text = (limite - gasto).toString();

    /*load(AppImages.ic_add_user, 40, 40).then((image) {
      setState(() {
        customImage = image;
      });
    });
    load(AppImages.ic_add_user, 0, 0).then((image) {
      setState(() {
        customImage2 = image;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Ajuste de Limite",
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Text(
                    moneyInputTextController.text,
                    style: TextStyles.textBigBold,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  )
                ],
              ),
            ),
            Text(
              "${moneyInputDisponivelTextController.text} ficará disponível",
              style: TextStyles.textMoneyGreen,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 8,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.green[100],
                  overlayColor: Colors.transparent,
                  thumbShape: CustomThumbShape(customImage2),
                ),
                child: Slider.adaptive(
                  max: 200000,
                  value: limite,
                  divisions: 40,
                  onChanged: (value) {
                    setState(() {
                      if (value == 0)
                        limite = 3000;
                      else
                        limite = value;
                      moneyInputTextController.text = limite.toString();
                      moneyInputDisponivelTextController.text =
                          (limite - gasto).toString();
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 0,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.green[100],
                  overlayColor: Colors.transparent,
                  thumbColor: AppColors.primary,
                  thumbShape: CustomThumbShape(customImage),
                  trackShape: CustomTrackShape(),
                ),
                child: Slider.adaptive(
                  max: 200000,
                  value: limite,
                  divisions: 40,
                  onChanged: (value) {
                    setState(() {
                      if (value == 0)
                        limite = 3000;
                      else
                        limite = value;
                      moneyInputTextController.text = limite.toString();
                      moneyInputDisponivelTextController.text =
                          (limite - gasto).toString();
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ajustar limite para ${moneyInputTextController.text}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButtonWidget(
                onPressed: () {},
                icon: Icons.add,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 16,
                ),
                child: Text(
                  "Pedir\naumento",
                  textAlign: TextAlign.center,
                  style: TextStyles.textBlackSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  final ui.Image? image;

  CustomThumbShape(this.image);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(30, 30);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final imageWidth = image?.width ?? 10;
    final imageHeight = image?.height ?? 10;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight / 2),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    if (image != null) {
      canvas.drawImage(image!, imageOffset, paint);
    }
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx + 8;
    final double trackTop = offset.dy;
    final double trackWidth = parentBox.size.width - 16;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
