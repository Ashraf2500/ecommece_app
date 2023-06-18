import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/shimmar/custom_flash_loading.dart';

class OneProductForListView extends StatelessWidget {
  const OneProductForListView({
    super.key,
    required this.image,
    required this.title,
    required this.dataPrice,
    required this.dataOldPrice,
    required this.dataSale,
  });
  final String image;
  final String title;
  final double dataPrice;
  final int dataOldPrice;
  final double dataSale;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) {
        return Customflashloading();
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 141,
          decoration: BoxDecoration(
              border: Border.all(color: kBorderColor),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        height: 90,
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle11,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${dataPrice}",
                      style: Style.textStyle12.copyWith(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "${dataOldPrice}",
                          style: Style.textStyle10
                              .copyWith(color: kDescriptionText),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${dataSale} 24%off",
                          style: Style.textStyle10.copyWith(color: kRedColor),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}