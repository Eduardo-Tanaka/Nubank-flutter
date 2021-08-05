import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileAjudaShimmerWidget extends StatelessWidget {
  const TileAjudaShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.white,
            child: Text("", style: TextStyles.textAjudaBold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text("", style: TextStyles.textAjuda),
            ),
          ),
        ],
      ),
    );
  }
}
