import '../../app/env.dart';
import '../../app/locator.dart';

class ApiEndpoints {
  //https://api-dev.tipmee.com
  static final ENV env = getIt<ENV>();
  static final BaseUrlFactory _baseUrlFactory = BaseUrlFactory(
    isDebug: env.enviroment == Enviroment.staging,
    apiBaseUrl: env.apiBaseUrl,
    prodApiBaseUrl: "env.prodApiBaseUrl",
  );

  static final String _baseUrlV1 = _baseUrlFactory.baseUrlV1;

  /// Auth
  static final String login = '$_baseUrlV1/auth/login';

  static final String createAccount = "$_baseUrlV1/auth/register";
  static final String verifyOtp = "$_baseUrlV1/auth/register/validate-otp";
  static final String validateUser = "$_baseUrlV1/auth/register/validate";
  static final String setPin = "$_baseUrlV1/auth/register/pin";

  static final String forgotPassword = "$_baseUrlV1/auth/forgot";
  static final String uploadAvatar = "$_baseUrlV1/auth/register/avatar";

  static final String resetPassword = "$_baseUrlV1/auth/forgot/reset";
  static final String sendResetPasswordCode = "$_baseUrlV1/auth/forgot";
  static final String validateResetPasswordCode = "$_baseUrlV1/auth/forgot/otp";

  /// Cards
  static final String addCards = "$_baseUrlV1/card/initiate";
  static final String getCards = "$_baseUrlV1/card";
  static String deleteCards(String id) => "$_baseUrlV1/card/$id";

  /// Tip
  static final String buyToken = "$_baseUrlV1/token/buy";
  static final String calculateToken = "$_baseUrlV1/token/calculate";
  static final String searchRecipients = "$_baseUrlV1/token/recipient";
  static final String tip = "$_baseUrlV1/tip";

  static final String createWithdrawalAccount = "$_baseUrlV1/payouts/account";
  static final String getWithdrawalAccount = "$_baseUrlV1/payouts/account";
  static final String payout = "$_baseUrlV1/payouts/request";
  static String getAccountForm(int id) => "$_baseUrlV1/payouts/form/$id";

  /// Profile
  static final String getUser = "$_baseUrlV1/user";
  static final String getSettings = "$_baseUrlV1/api/app-settings";
  static final String getCountries = "$_baseUrlV1/api/countries";
  static final String changePin = "$_baseUrlV1/user/pin";
  static final String referral = "$_baseUrlV1/user/referrals";

  /// Transaction
  static final String getTransactions = "$_baseUrlV1/transactions";

  static String getTransaction(String id) => "$_baseUrlV1/transactions/$id";
}

class BaseUrlFactory {
  final bool _isStaging;
  final String _prodApiBaseUrl;
  final String _apiBaseUrl;

  const BaseUrlFactory({
    required bool isDebug,
    required String prodApiBaseUrl,
    required String apiBaseUrl,
  })  : _isStaging = isDebug,
        _prodApiBaseUrl = prodApiBaseUrl,
        _apiBaseUrl = apiBaseUrl;

  String get _baseUrl {
    final String stagingUrl = _apiBaseUrl.endsWith("/")
        ? _apiBaseUrl.substring(0, _apiBaseUrl.length - 1)
        : _apiBaseUrl;
    final String prodUrl = _prodApiBaseUrl.endsWith("/")
        ? _prodApiBaseUrl.substring(0, _prodApiBaseUrl.length - 1)
        : _prodApiBaseUrl;

    return _isStaging ? stagingUrl : prodUrl;
  }

  // String get baseUrlV1 => "$_baseUrl/api/v1";
  String get baseUrlV1 => _baseUrl;
}
