import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/product_details_for_favorite.dart';
import '../../../data/repo/home_repo_impl.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.homeRepoImpl) : super(ProductDetailsInitial());
  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  HomeRepoImpl homeRepoImpl;

  Future<void> getproductDetailsForFav({int? id}) async {
    emit(ProductDetailsLoading());
    final data = await homeRepoImpl.productDetailsForFavorite(id!);

    data.fold((failure) {
      emit(ProductDetailsFailure(errMessages: failure.errMessages));
    }, (data) {
      emit(ProductDetailsSuccess(productDetailsForFavoritesModel: data));
    });
  }
}
