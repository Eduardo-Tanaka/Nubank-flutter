import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final double? value;

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  AppBarWidget({
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Visibility(
        visible: value == null ? false : true,
        child: Container(
          width: 100,
          child: LinearProgressIndicator(
            color: AppColors.background,
            backgroundColor: Colors.grey[100],
            value: value,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.grey),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
