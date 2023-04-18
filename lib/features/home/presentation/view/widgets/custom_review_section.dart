import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_description_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_smooth_Rating_widget.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: Image.asset(Images.profile),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  "James Lawson",
                  style: Style.textStyle14.copyWith(color: kTextkColor),
                ),
                SmoothRating()
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        DescriptionText(
          text:
              "air max are always very comfortable fit, clean and\njust perfect in every way. just the box was too small\nand scrunched the sneakers up a little bit, not sure if\nthe box was always this small but the 90s are and\nwill always be one of my favorites.",
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
