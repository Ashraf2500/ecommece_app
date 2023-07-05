import 'package:ecommece_app/features/account/presentation/view/account_view.dart';
import 'package:ecommece_app/features/cart/presentation/view/cart_view.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/fav_body.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/more_category_body.dart';
import 'package:ecommece_app/features/login/presentation/view/login_view.dart';
import 'package:ecommece_app/features/offer/presentation/view/offer_view.dart';
import 'package:ecommece_app/features/regis/presentation/views/regis_view.dart';
import 'package:ecommece_app/features/splach/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/account/presentation/view/widgets/prodile_body.dart';
import '../../features/cart/presentation/view/widgets/payment_success.dart';
import '../../features/home/presentation/view/widgets/product_details_body.dart';
import '../../features/home/presentation/view/widgets/review_product_body.dart';
import '../../features/main_Screens/presentation/view/bottom_bar_view.dart';

abstract class AppRouer {
  static const String KsplachView = "/";
  static const String KHomeView = "/HomeView";
  static const String KAccountView = "/AccountView";
  static const String KCartView = "/CartView";
  static const String KExploreView = "/ExploreView";
  static const String KBottomBarView = "/BottomBarView";
  static const String KOfferView = "/OfferView";
  static const String KRegisView = "/RegisView";
  static const String KLoginView = "/LoginView";
  static const String KProfileBody = "/ProfileBody";
  static const String KProductBody = "/ProductBody";
  static const String KFavBody = "/FavBody";
  static const String KMoreCategotyBody = "/MoreCategotyBody";
  static const String KReviewProductBody = "/ReviewProductBody";
    static const String KPaymentSuccess = "/PaymentSuccess";



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: KsplachView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KAccountView,
        builder: (context, state) => const AccountView(),
      ),
      GoRoute(
          path: KCartView,
          builder: (context, state) {
            final Check = state.extra as bool;
            return CartView(
              chech: Check,
            );
          }),
      GoRoute(
        path: KExploreView,
        builder: (context, state) => const ExploreView(),
      ),
      GoRoute(
        path: KBottomBarView,
        builder: (context, state) => const BottomBarView(),
      ),
      GoRoute(
        path: KOfferView,
        builder: (context, state) => const OfferView(),
      ),
      GoRoute(
        path: KRegisView,
        builder: (context, state) => const RegisView(),
      ),
      GoRoute(
        path: KLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: KProfileBody,
        builder: (context, state) => const ProfileBody(),
      ),
      GoRoute(
        path: KProductBody,
        builder: (context, state) {
          final dataName = state.extra as String;
          return ProductBody(name: dataName);
        },
      ),
      GoRoute(
        path: KFavBody,
        builder: (context, state) => const FavBody(),
      ),
      GoRoute(
        path: KMoreCategotyBody,
        builder: (context, state) => const MoreCategotyBody(),
      ),
      GoRoute(
        path: KReviewProductBody,
        builder: (context, state) => ReviewProductBody(),
      ),
      GoRoute(
        path: KPaymentSuccess,
        builder: (context, state) => const PaymentSuccess(),
      ),
    ],
  );
}
