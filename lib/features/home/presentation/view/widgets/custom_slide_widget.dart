import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommece_app/core/utils/style.dart';
import '../../../../../core/utils/shimmar/custom_carosil_loading.dart';
import 'custom_smooth _indicator_widget.dart';
import 'custom_time_sale_widget.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    required this.dataLenght,
    required this.data,
    required this.heightSlider,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
  final int dataLenght;
  final List<String> data;
  final double heightSlider;
}

class _CustomSliderState extends State<CustomSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.dataLenght,
          itemBuilder: (context, index, realIndex) {
            String image = widget.data[index];

            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    imageSlider(image),
                    timeSaleSlider(),
                  ],
                );
              },
            );
          },
          options: CarouselOptions(
            height: widget.heightSlider,
            aspectRatio: 16 / 9,
            viewportFraction: 0.91,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
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
        const SizedBox(
          height: 15,
        ),
        CustomSmoothIndicator(
            activeIndex: activeIndex, count: widget.dataLenght),
      ],
    );
  }
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
          style: Style.textStyle24.copyWith(color: kBackGroundColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "50% Off",
          style: Style.textStyle24.copyWith(color: kBackGroundColor),
        ),
        const SizedBox(height: 15),
        //---time ----------
        const Row(
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

imageSlider(
  String data,
) {
  return SizedBox(
    width: double.infinity,
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: data,
        errorWidget: (context, url, error) => const Icon(Icons.abc),
        placeholder: (context, url) => const CustomCarosilLoading(),
        imageBuilder: (context, imageProvider) {
          return Image(image: imageProvider);
        },
      ),
    ),
  );
}
