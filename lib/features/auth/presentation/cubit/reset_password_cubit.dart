import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmetermobile/cores/base_request_body/base_request_body.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/email_formz_validator.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/required_formz_validator.dart';

final class ResetPasswordCubit extends Cubit<ResetPasswordParam> {
  ResetPasswordCubit() : super(const ResetPasswordParam());

  void reset() => emit(const ResetPasswordParam());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: Email.dirty(email)));
  }

  void onCodeChanged(String code) {
    emit(state.copyWith(code: Required.dirty(code)));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: Required.dirty(password)));
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: Required.dirty(confirmPassword)));
  }
}

final class ResetPasswordParam extends RequestParam {
  final Email email;
  final Required code;
  final Required password;
  final Required confirmPassword;

  const ResetPasswordParam({
    this.email = const Email.pure(),
    this.code = const Required.pure(),
    this.password = const Required.pure(),
    this.confirmPassword = const Required.pure(),
  });

  bool get stageOneVaild => email.isValid;
  bool get stageTwoVaild => code.isValid && code.value.length == 6;
  bool get stageThreeVaild => password.isValid && confirmPassword.isValid;

  ResetPasswordParam copyWith({
    Email? email,
    Required? code,
    Required? password,
    Required? confirmPassword,
  }) {
    return ResetPasswordParam(
      email: email ?? this.email,
      code: code ?? this.code,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "email": email.value,
      "code": code.value,
      "otp": code.value,
      "password": password.value,
      "password_confirmation": confirmPassword.value,
    };
  }

  @override
  List<Object?> get props => [email, code, password, confirmPassword];
}
