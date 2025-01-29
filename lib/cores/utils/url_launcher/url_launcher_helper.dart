class UrlLauncherHelper {
  static void launchEmail(String email) async {
    // final Uri params = Uri(
    //   scheme: 'mailto',
    //   path: 'email@example.com',
    //   // query: 'subject=App Feedback&body=App Version 3.23',
    //   query: 'subject=App Feedback',
    // );
    //
    // try {
    //   if (await canLaunchUrl(params)) {
    //     await launchUrl(params, mode: LaunchMode.externalApplication);
    //   }
    // } catch (e, s) {
    //   LoggerHelper.log(e, s);
    // }
  }

  static void call(String number) async {
    // final param = Uri(scheme: 'tel', path: number);
    //
    // try {
    //   if (await canLaunchUrl(param)) {
    //     await launchUrl(param);
    //   }
    // } catch (e, s) {
    //   LoggerHelper.log(e, s);
    // }
  }
}
