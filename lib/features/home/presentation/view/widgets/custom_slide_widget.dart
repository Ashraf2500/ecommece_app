import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_time_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommece_app/core/utils/style.dart';

import 'custom_smooth _indicator_widget.dart';


class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    imageSlider(),
                    timeSaleSlider(),
                  ],
                );
              },
            );
          },
          options: CarouselOptions(
            height: heightScreen * (25 / 100),
            aspectRatio: 16 / 9,
            viewportFraction: 0.91,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 1700),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CustomSmoothIndicator(activeIndex: activeIndex),
      ],
    );
  }

  timeSaleSlider() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---title ----------
          Text(
            "Super Flash Sale",
            style: Style.textStyle24.copyWith(
              color: kBackGroundColor
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "50% Off",
            style: Style.textStyle24.copyWith(
              color: kBackGroundColor
            ),
          ),
          const SizedBox(height: 15),
          //---time ----------
          Row(
            children: [
              CustomTimeSale(text: "08"),
              //const SizedBox(width: 8),
              CustomTimeSale(text: "34"),
              // const SizedBox(width: 8),
              CustomTimeSale(text: "52"),
            ],
          ),
        ],
      ),
    );
  }

  imageSlider() {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Image(
          image: AssetImage("assets/images/shoe1.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
