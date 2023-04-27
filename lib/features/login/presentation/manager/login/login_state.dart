// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
 final LoginModel loginModel;
  LoginSuccess({
    required this.loginModel,
  });
}
class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure({
    required this.errorMessage,
  });

}
  class ConvertObsucure extends LoginState {}
