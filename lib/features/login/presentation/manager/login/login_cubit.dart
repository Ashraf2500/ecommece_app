import 'package:dio/dio.dart';
import 'package:ecommece_app/features/login/presentation/data/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool obscureText = false;
  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  Future<void> postData({
    required String email,
    required String password,
    String? token,
  }) async {
    try {
      emit(LoginLoading());
      final response = await Dio(BaseOptions(headers: {
        "lang": "en",
        "Content-Type": "application/json",
        "Authorization": token
      })).post(
        'https://student.valuxapps.com/api/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      loginModel = LoginModel.fromJson(response.data);
      
      emit(LoginSuccess(loginModel: loginModel));
    } on DioError catch (e) {
      print(e.response);
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  void obsucureText() {
    obscureText = !obscureText;
    emit(ConvertObsucure());
  }
}
