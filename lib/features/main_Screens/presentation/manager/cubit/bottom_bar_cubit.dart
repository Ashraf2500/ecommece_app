import 'package:ecommece_app/features/account/presentation/view/account_view.dart';
import 'package:ecommece_app/features/cart/presentation/view/cart_view.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:ecommece_app/features/offer/presentation/view/offer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial());

  static BottomBarCubit get(context) => BlocProvider.of(context);
  ScrollController sc = ScrollController();

  List<Widget> screensOfNavigatorButton = [
    const HomeView(),
    const ExploreView(),
    const CartView(chech: false),
    const OfferView(),
    const AccountView(),
  ];
  int currentIndex = 0;

  navScreen(index) {
    currentIndex = index;
    emit(BottomBarNavState());
  }
}
