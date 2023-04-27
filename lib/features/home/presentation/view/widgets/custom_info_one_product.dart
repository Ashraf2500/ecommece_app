import 'package:flutter/material.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/style.dart';

class CustomInfoOneProduct extends StatelessWidget {
  const CustomInfoOneProduct({
    Key? key,
    required this.image,
    required this.title,
    required this.newPrice,
    required this.oldPrice,
    required this.sale,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String image;
  final String title;
  final double newPrice;
  final double oldPrice;
  final int sale;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      decoration: BoxDecoration(
          color: kBackGroundColor,
          border: Border.all(color: kBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                height: 200,
                child: Image.network(image),
              ),
              onTap: () {
                // Get.to(() => ProductBody());
              },
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "$title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              //
              style: Style.textStyle11,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$newPrice",
              style: Style.textStyle12
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$oldPrice",
                  style: Style.textStyle11.copyWith(
                      color: kDescriptionText,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 8,
                ),
                if (sale != 0)
                  Text(
                    "${sale.round()} %Off",
                    style: Style.textStyle11.copyWith(color: kOfferColor),
                  ),
                (icon != null)
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onPressed,
                        icon: icon!,
                        color: kDescriptionText,
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
