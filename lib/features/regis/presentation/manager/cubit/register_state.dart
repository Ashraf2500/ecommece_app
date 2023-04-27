part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
   final RegisModel regisModel;

   RegisterSuccess({required this.regisModel});
  

}
class RegisterFailure extends RegisterState {
 final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
