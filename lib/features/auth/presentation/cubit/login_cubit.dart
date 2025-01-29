import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmetermobile/cores/base_request_body/base_request_body.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/email_formz_validator.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/password_formz_validator.dart';

final class LoginCubit extends Cubit<LoginParamz> {
  LoginCubit() : super(const LoginParamz());

  void reset() => emit(const LoginParamz());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: Email.dirty(email)));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: Password.dirty(password)));
  }
}

final class LoginParamz extends RequestParam {
  final Email email;
  final Password password;

  const LoginParamz({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  bool get isValid => email.isValid && password.isValid;

  LoginParamz copyWith({Email? email, Password? password}) {
    return LoginParamz(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];

  @override
  Map<String, dynamic> toMap() {
    return {'email': email.value, 'password': password.value};
  }
}
