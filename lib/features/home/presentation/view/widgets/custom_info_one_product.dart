import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/shimmar/custom_grid_view_loading.dart';
import '../../../../../core/utils/style.dart';
import '../../manager/banners_and_grid_view/home_cubit.dart';

class CustomInfoOneProduct extends StatelessWidget {
  const CustomInfoOneProduct({
    Key? key,
    required this.image,
    required this.title,
    required this.newPrice,
    this.oldPrice,
    this.sale,
    this.icon,
    this.onPressed,
    required this.id,
  }) : super(key: key);

  final String image;
  final String title;
  final double newPrice;
  final double? oldPrice;
  final int? sale;
  final Icon? icon;
  final VoidCallback? onPressed;
  final int id;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) {
        return const CustomGridViewLoading();
      },
      errorWidget: (context, url, error) {
        return Container(
          // Fallback widget when image fails to load
          width: 141,
          height: 200,
          decoration: BoxDecoration(
            color: kBackGroundColor,
            border: Border.all(color: kBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        );
      },
      imageBuilder: (context, imageProvider) {
        // Your existing image builder code
        return Container(
          width: 141,
          decoration: BoxDecoration(
            color: kBackGroundColor,
            border: Border.all(color: kBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Style.textStyle11,
                ),
                const SizedBox(height: 10),
                Text(
                  "$newPrice",
                  style: Style.textStyle12.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (oldPrice != null && oldPrice != 0) // تحقق من القيمة قبل استخدامها كشرط
                      Text(
                        "$oldPrice",
                        style: Style.textStyle11.copyWith(
                          color: kDescriptionText,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const SizedBox(width: 8),
                    if (sale != null && sale != 0) // تحقق من القيمة قبل استخدامها كشرط
                      Text(
                        "$sale %Off",
                        style: Style.textStyle11.copyWith(color: kOfferColor),
                      ),
                    if (icon != null)
                    
                 IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onPressed,
                          icon: icon!,
                          color:   HomeCubit.get(context).favorite[id]! ? kRedColor : kDescriptionText,
                        ),
                      
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
