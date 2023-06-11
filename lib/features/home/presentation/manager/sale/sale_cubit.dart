import 'package:bloc/bloc.dart';
import 'package:ecommece_app/features/home/data/model/sale_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

part 'sale_state.dart';

class SaleCubit extends Cubit<SaleState> {
  SaleCubit(this.homeRepoImpl) : super(SaleInitial());

  HomeRepoImpl homeRepoImpl;

  Future<void> getData() async {
    emit(SaleLoading());

    final data = await homeRepoImpl.sale();

    data.fold(
      (errorMessage) {
        emit(SaleFailure(errorMessage: errorMessage.errMessages));
      },
      (data) {
        emit(SaleSuccess(saleModel: data));
      },
    );
  }
}
