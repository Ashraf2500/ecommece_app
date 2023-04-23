import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingForBanners extends StatelessWidget {
  CustomLoadingForBanners({super.key, required this.dataLength});
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        
        itemCount: dataLength,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 167, 167, 167),
            highlightColor: Colors.grey[50]!,
            period: const Duration(seconds: 2),
            child: Container(
             height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey),
            ),
          );
        });
  }
}
