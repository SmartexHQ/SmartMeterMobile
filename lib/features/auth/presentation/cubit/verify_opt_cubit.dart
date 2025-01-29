import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmetermobile/cores/base_request_body/base_request_body.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/email_formz_validator.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/required_formz_validator.dart';

final class VerifyOptCubit extends Cubit<VerifyOptParam> {
  VerifyOptCubit() : super(const VerifyOptParam());

  void reset() => emit(const VerifyOptParam());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: Email.dirty(email)));
  }

  void onCodeChanged(String code) {
    emit(state.copyWith(code: Required.dirty(code)));
  }
}

final class VerifyOptParam extends RequestParam {
  final Email email;
  final Required code;

  const VerifyOptParam({
    this.email = const Email.pure(),
    this.code = const Required.pure(),
  });

  bool get isValid => email.isValid && code.isValid;

  VerifyOptParam copyWith({Email? email, Required? code}) {
    return VerifyOptParam(
      email: email ?? this.email,
      code: code ?? this.code,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {'email': email.value, 'otp': code.value};
  }

  @override
  List<Object?> get props => [email, code];
}
