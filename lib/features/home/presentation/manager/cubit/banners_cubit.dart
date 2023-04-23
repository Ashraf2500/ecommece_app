import 'package:bloc/bloc.dart';
import 'package:ecommece_app/features/home/data/model/banners_model.dart';
import 'package:ecommece_app/features/home/data/repo/banners_repo.dart';
import 'package:meta/meta.dart';
part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.bannersRepo) : super(BannersInitial());
  final BannersRepo bannersRepo;

  void getData() async {
    emit(BannersLoading());
    final data = await bannersRepo.getBanners();

    data.fold(
      (failure) {
        emit(BannersFailure(errorMessage: failure.errMessages));
      },
      (data) {
        emit(BannersSuccess(banners: data));
      },
    );
  }
}
