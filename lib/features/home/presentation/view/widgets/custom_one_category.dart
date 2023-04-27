import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommece_app/core/utils/shimmar/custom_loading_category.dart';
import 'package:flutter/material.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/style.dart';

class CustomOneCategory extends StatelessWidget {
  CustomOneCategory({
    Key? key,
    required this.image,
    required this.title,
    required this.length,
  }) : super(key: key);

  final String image;
  final String title;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: CachedNetworkImage(
              imageUrl: image,
              errorWidget: (context, url, error) => Icon(Icons.abc),
              placeholder: (context, url) => CustomLoadingCategory(
                    dataLength: length,
                  )),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffe6ecff)),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          "$title",
          style: Style.textStyle14.copyWith(
            color: kDescriptionText,
          ),
        ),
      ],
    );
  }
}
