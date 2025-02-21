import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmetermobile/cores/utils/http_helper.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/login_cubit.dart';

final class LoginBloc extends Cubit<LoginState> {
  final HttpHelper httpHelper;
  LoginBloc({required this.httpHelper}) : super(const LoginInitial());

  Future<void> login(LoginParamz param) async {
    emit(const LoginLoading());
    try {
      final response = await httpHelper.post(
        url: "/api/login",
        body: {"email": param.email.value, "password": param.password.value},
      );

      emit(const LoginSuccess());
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}

final class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginSuccess extends LoginState {
  const LoginSuccess();
}

final class LoginError extends LoginState {
  final String error;

  const LoginError({required this.error});

  @override
  List<Object?> get props => [error];
}
