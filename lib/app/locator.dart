import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:local_auth/local_auth.dart';

import '../cores/navigator/app_navigation_observer.dart';
import '../cores/navigator/navigator.dart';
import '../cores/shared_features/loading_overlay/bloc/loading_over_lay_bloc.dart';
import '../cores/shared_session/authentication_local_storage_data_source.dart';
import '../cores/utils/utils.dart';
import 'env.dart';

final GetIt getIt = GetIt.instance;

class Locator {
  static const Locator _instance = Locator._();
  const Locator._();
  factory Locator() => _instance;

  static void init() {
    _setUp();
    _otherSetup();

    /// -------- Authentication -------- ///
    // setUpAuthLocator();
  }

  static void _otherSetup() {
    getIt.registerLazySingleton<HttpHelper>(
      () => HttpHelper(client: Client(), appRouter: AppRouter.instance),
    );
  }

  static void _setUp() {
    ///--------------- ENV --------------------//
    getIt.registerSingleton<ENV>(ENV());

    ///--------------- Push Notification --------------------//
    // getIt.registerLazySingleton<PushNotificationHelper>(
    //   () => PushNotificationHelper(),
    // );

    ///--------------- Local Auth --------------------///
    getIt.registerLazySingleton<AuthLocalStorageDataSource>(
      () => AuthLocalStorageDataSourceImp(
        storage: const FlutterSecureStorage(),
        localAuth: LocalAuthentication(),
      ),
    );

    ///--------------- App Navigation Observer --------------------///
    getIt.registerLazySingleton(() => AppNavObserver());

    ///--------------- Loading Overlay --------------------///
    getIt.registerLazySingleton(() => LoadingOverlayBloc());
  }

  void dispose() => getIt.reset();
}
