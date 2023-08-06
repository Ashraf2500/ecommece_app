import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/service_loctor.dart';
import 'package:ecommece_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:ecommece_app/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommece_app/features/cart/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:ecommece_app/features/cart/manager/update_cart/update_cart_cubit.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:ecommece_app/features/home/presentation/manager/banners_and_grid_view/home_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/more_category/more_category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details/product_details_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/sale/sale_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/search/search_cubit.dart';
import 'package:ecommece_app/features/main_Screens/presentation/manager/cubit/bottom_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/stripe_payment/payment_managers.dart';
import 'features/home/presentation/manager/fav/fav_cubit.dart';
import 'features/home/presentation/manager/product_details_two/product_details_two_cubit.dart';

void main() {
  Stripe.publishableKey = PaymentManager.publishablekey;
  setup();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeCubit(getIt.get<HomeRepoImpl>())..getHomeData()),
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(getIt.get<HomeRepoImpl>())..getCategory(),
        ),
        BlocProvider(
            create: (context) =>
                SaleCubit(getIt.get<HomeRepoImpl>())..getData()),
        BlocProvider(
            create: (context) =>
                MoreCategoryCubit(getIt.get<HomeRepoImpl>())..getData()),
        BlocProvider(create: (context) => FavCubit(getIt.get<HomeRepoImpl>())),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ProductDetailsTwoCubit(getIt.get<HomeRepoImpl>())
            ..getProductDetailsTwo(),
        ),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) => GetCartCubit(CartRepoImpl()),
        ),
        BlocProvider(
          create: (context) => UpdateCartCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouer.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: kBackGroundColor,
            textTheme: GoogleFonts.poppinsTextTheme()),
      ),
    );
  }
}
