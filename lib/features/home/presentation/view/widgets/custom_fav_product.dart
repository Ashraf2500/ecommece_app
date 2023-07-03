import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/shimmar/custom_grid_view_loading.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/manager/banners_and_grid_view/home_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details/product_details_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_smooth_Rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class CustomFavProduct extends StatelessWidget {
  const CustomFavProduct({
    Key? key,
    required this.image,
    required this.title,
    required this.newPrice,
    this.oldPrice,
    this.sale,
    required this.id,
  }) : super(key: key);

  final String image;
  final String title;
  final double newPrice;
  final double? oldPrice;
  final int? sale;
  final int id;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) {
        return const CustomGridViewLoading();
      },
      errorWidget: (context, url, error) {
        return Container(
          // Fallback widget when image fails to load
          width: 141,
          height: 200,
          decoration: BoxDecoration(
            color: kBackGroundColor,
            border: Border.all(color: kBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        );
      },
      imageBuilder: (context, imageProvider) {
        return InkWell(
          onTap: () {
            ProductDetailsCubit.get(context).getproductDetailsForFav(id: id);
          GoRouter.of(context).push(AppRouer.KProductBody);
          },
          child: Container(
              width: 141,
              decoration: BoxDecoration(
                color: kBackGroundColor,
                border: Border.all(color: kBorderColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                  
                      child: Image(image: imageProvider),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle11,
                    ),
                    const SizedBox(height: 8),
                    const SmoothRating(
                        textOne: "4.5", textTwo: "(5 Review)", itemSize: 15),
                    const SizedBox(height: 10),
                    Text(
                      "$newPrice",
                      style: Style.textStyle12.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (oldPrice != null &&
                            oldPrice != 0) // تحقق من القيمة قبل استخدامها كشرط
                          Text(
                            "$oldPrice",
                            style: Style.textStyle11.copyWith(
                              color: kDescriptionText,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const SizedBox(width: 8),
                        if (sale != null &&
                            sale != 0) // تحقق من القيمة قبل استخدامها كشرط
                          Text(
                            "$sale %Off",
                            style:
                                Style.textStyle11.copyWith(color: kOfferColor),
                          ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.read<HomeCubit>().sendFavorite(id, context);
                          },
                          icon: Image.asset(Images.rubbish),
                          color: kDescriptionText,
                          iconSize: 27,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
