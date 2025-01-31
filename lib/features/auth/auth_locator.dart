import 'package:smartmetermobile/app/locator.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/login_cubit.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/set_pin_cubit.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/verify_opt_cubit.dart';

void setUpAuthLocator() {
  getIt
    ..registerLazySingleton(() => LoginCubit())
    ..registerLazySingleton(() => SignUpCubit())
    ..registerLazySingleton(() => VerifyOptCubit())
    ..registerLazySingleton(() => SetPinCubit())
    ..registerLazySingleton(() => ResetPasswordCubit());
}
