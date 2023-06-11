import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SmoothRating extends StatefulWidget {
  SmoothRating({super.key, this.textOne, this.textTwo, required this.itemSize});
  final String? textOne;
  final String? textTwo;
 final double itemSize;
  @override
  State<SmoothRating> createState() => _SmoothRatingState();
}

class _SmoothRatingState extends State<SmoothRating> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          allowHalfRating: true,
          initialRating: 4,
          itemCount: 5,
          itemSize: widget.itemSize,
          glow: false,
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: kRatingColor,
          ),
          onRatingUpdate: (value) => setState(
            () {
              rating = value;
            },
          ),
        ),
        SizedBox(
          width: 3,
        ),
        widget.textOne != null
            ? Text(
                widget.textOne!,
                style: Style.textStyle10.copyWith(color: kDescriptionText),
              )
            : SizedBox(),
        SizedBox(
          width: 3,
        ),
        widget.textTwo != null
            ? Text(
                widget.textTwo!,
                style: Style.textStyle10.copyWith(color: kDescriptionText),
              )
            : SizedBox(),
      ],
    );
  }
}
