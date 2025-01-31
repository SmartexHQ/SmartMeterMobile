import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/email_formz_validator.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/required_formz_validator.dart';

import '../../../../cores/base_request_body/base_request_body.dart';

final class SignUpCubit extends Cubit<SignUpParamz> {
  SignUpCubit() : super(const SignUpParamz());

  void reset() => emit(const SignUpParamz());

  void onFirstNameChanged(String firstName) {
    emit(state.copyWith(firstName: Required.dirty(firstName)));
  }

  void onLastNameChanged(String lastName) {
    emit(state.copyWith(lastName: Required.dirty(lastName)));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: Email.dirty(email)));
  }

  void onConfirmEmailChanged(String confirmEmail) {
    emit(state.copyWith(confirmEmail: Required.dirty(confirmEmail)));
  }

  void onReferralCodeChanged(String referralCode) {
    emit(state.copyWith(referralCode: Required.dirty(referralCode)));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: Required.dirty(password)));
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: Required.dirty(confirmPassword)));
  }

  void onPhoneChanged(String phone) {
    emit(state.copyWith(phone: Required.dirty(phone)));
  }
}

final class SignUpParamz extends RequestParam {
  final Required firstName;
  final Required lastName;
  final Email email;
  final Required confirmEmail;
  final Required referralCode;
  final Required password;
  final Required confirmPassword;
  final Required phone;

  const SignUpParamz({
    this.firstName = const Required.pure(),
    this.lastName = const Required.pure(),
    this.email = const Email.pure(),
    this.confirmEmail = const Required.pure(),
    this.referralCode = const Required.pure(),
    this.password = const Required.pure(),
    this.confirmPassword = const Required.pure(),
    this.phone = const Required.pure(),
  });

  bool get stageOneValid => firstName.isValid && lastName.isValid;

  SignUpParamz copyWith({
    Required? firstName,
    Required? lastName,
    Email? email,
    Required? confirmEmail,
    Required? referralCode,
    Required? password,
    Required? confirmPassword,
    Required? phone,
  }) {
    return SignUpParamz(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      confirmEmail: confirmEmail ?? this.confirmEmail,
      referralCode: referralCode ?? this.referralCode,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        confirmEmail,
        referralCode,
        password,
        confirmPassword,
        phone,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      if (firstName.isValid) 'first_name': firstName.value,
      if (lastName.isValid) 'last_name': lastName.value,
      if (email.isValid) 'email': email.value,
      if (confirmEmail.isValid) 'confirm_email': confirmEmail.value,
      if (referralCode.isValid) 'referral_code': referralCode.value,
      if (password.isValid) 'password': password.value,
      if (confirmPassword.isValid)
        'password_confirmation': confirmPassword.value,
    };
  }
}
