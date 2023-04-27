import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingForBanners extends StatelessWidget {
  CustomLoadingForBanners({super.key, required this.dataLength});
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return SizedBox(
      height: heightScreen * (25 / 100),
      width: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: dataLength,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 167, 167, 167),
              highlightColor: Colors.grey[50]!,
              period: const Duration(seconds: 2),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: heightScreen * (25 / 100),
                width: 390,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey),
              ),
            );
          }),
    );
  }
}
