import 'package:ecommece_app/core/utils/constans.dart';
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
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  "James Lawson",
                  style: Style.textStyle14.copyWith(color: kTextkColor),
                ),
                const SmoothRating(itemSize: 20,)
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        DescriptionText(
          text:
              "Enhanced Protective Materials: To prevent the sneakers from being affected by the smaller box size, Nike could include additional protective materials, such as foam inserts or shoe trees, to maintain the original shape and structure during transit. This would guarantee that customers receive their Air Max 90s in optimal condition. ",
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
