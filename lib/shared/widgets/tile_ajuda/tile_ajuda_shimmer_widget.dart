import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileAjudaShimmerWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final bool expandSubtitle;

  const TileAjudaShimmerWidget({
    Key? key,
    this.title,
    this.description,
    this.expandSubtitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 8;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.white,
            child: Text(title ?? "", style: TextStyles.textAjudaBold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: expandSubtitle
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Text(
                                  description ?? "",
                                ),
                              ),
                              SizedBox(
                                height: height,
                              ),
                            ],
                          );
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        color: Colors.white,
                        child: Text(
                          description ?? "",
                        ),
                      ),
                    ],
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Text(description ?? "", style: TextStyles.textAjuda),
                  ),
          ),
        ],
      ),
    );
  }
}
