import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingCategory extends StatelessWidget {
  const CustomLoadingCategory({super.key, required this.dataLength});
  final int dataLength;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: dataLength,
        itemBuilder: (context, index) {
          return 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Shimmer.fromColors(
                  period:const Duration(seconds: 5),
                  highlightColor: Colors.grey[50]!
                  ,
                  baseColor: Colors.grey[300]!,
                  child: Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
             
           
        });
  }
}
