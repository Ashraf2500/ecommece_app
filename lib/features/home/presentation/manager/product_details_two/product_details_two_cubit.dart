import 'package:ecommece_app/features/home/data/model/product_details_two.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_two_state.dart';

class ProductDetailsTwoCubit extends Cubit<ProductDetailsTwoState> {
  ProductDetailsTwoCubit(this.homeRepoImpl) : super(ProductDetailsTwoInitial());
  HomeRepoImpl homeRepoImpl;
  static ProductDetailsTwoCubit get(context) => BlocProvider.of(context);
      bool? dataHereOrNot ;
  Future<void> getProductDetailsTwo({int? id}) async {

  emit(ProductDetailsTwoLoading());
  

  final data = await homeRepoImpl.getMyProductDetailsTwo(id!);

  data.fold((failure) {
    emit(ProductDetailsTwoFailure(errMessages: failure.errMessages));
  }, (data) {
    emit(ProductDetailsTwoSuccess(productDetailsTwoModel: data));
  });
}

void dataishers(bool dataisHere){

dataHereOrNot = dataisHere ;

emit(ProductDetailsTwoHere());
}
}
