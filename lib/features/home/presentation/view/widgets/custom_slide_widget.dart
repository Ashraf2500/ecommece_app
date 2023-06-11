import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/presentation/manager/bannersandgridview/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/shimmar/custom_carosil_loading.dart';
import 'custom_smooth _indicator_widget.dart';
import 'custom_time_sale_widget.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key, }) : super(key: key);

 
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is HomeFailure){
          return Center(child: Text(state.errorMessage),);
        }
        if (state is HomeSuccess) {
           var dataLenght = state.homeModel!.data.banners.length;
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: dataLenght,
                itemBuilder: (context, index, realIndex) {
                  var data = state.homeModel!.data.banners[index].image;
                 
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          imageSlider(data, dataLenght),
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
              SizedBox(
                height: 15,
              ),
              CustomSmoothIndicator(activeIndex: activeIndex),
            ],
          );
        }return CustomCarosilLoading();
      },
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

imageSlider(String data, int dataLength) {
  return SizedBox(
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: data
          ,
          errorWidget: (context, url, error) => const Icon(Icons.abc),
          placeholder: (context, url) => CustomCarosilLoading(),
              ),
    ),
  );
}
