import 'package:dio/dio.dart';
import 'package:ecommece_app/features/regis/presentation/data/model/regis_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  late RegisModel regisModel;
  Future<void> postRegister(
      {required String textOne,
      required String textTwo,
      required String textThere,
      required String textFour}) async {
    emit(RegisterLoading());
    try {
      final response = await Dio().post(
        "https://student.valuxapps.com/api/register",
        data: {
          "name": textOne,
          "phone": textTwo,
          "email": textThere,
          "password": textFour,
        },
      );
      regisModel = RegisModel.fromJson(response.data);
      emit(RegisterSuccess(regisModel: regisModel));
    } on Exception catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }
}
