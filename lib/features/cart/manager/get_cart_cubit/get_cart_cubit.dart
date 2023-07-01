import 'package:ecommece_app/features/cart/data/model/get_cart_model.dart';
import 'package:ecommece_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this.cartRepoImpl) : super(GetCartInitial());
    CartRepoImpl cartRepoImpl;
    static GetCartCubit get(context)=>BlocProvider.of(context);

    

    Future<void> getDataForCart() async {
    emit(CartCubitLoadingforGetData());
  
    final cartdata = await cartRepoImpl.getcartData();

    

    cartdata.fold((failure) {
      emit(CartCubitFailureforGetData(errMessages: failure.errMessages));
    }, (data) {
      emit(CartCubitSuccessforGetData(getCartModel: data));
    });
  }
}
