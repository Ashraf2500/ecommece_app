import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constans.dart';
import '../../../../../core/utils/shimmar/custom_category_loading.dart';
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
        Expanded(
          child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: kBackGroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: kBorderColor),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.abc),
              placeholder: (context, url) => CustomCategoryLoading()),
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
