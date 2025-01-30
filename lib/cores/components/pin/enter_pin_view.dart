import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../app/locator.dart';
import '../../constants/color.dart';
import '../../navigator/navigator.dart';
import '../../shared_session/authentication_local_storage_data_source.dart';
import '../../utils/utils.dart';
import '../components.dart';
import 'widget/pin_pad_widget.dart';

class EnterPinView extends StatefulWidget {
  static const String routeName = "/enterPin";
  final bool showBiometric;

  const EnterPinView({super.key, this.showBiometric = true});

  @override
  State<EnterPinView> createState() => _EnterPinViewState();
}

class _EnterPinViewState extends State<EnterPinView> {
  late TextEditingController _controller;
  // static final GetProfileBloc _getProfileBloc = getIt<GetProfileBloc>();
  final AuthLocalStorageDataSource authLocalStorageDataSourceImp =
      getIt<AuthLocalStorageDataSource>();

  @override
  void initState() {
    _controller = TextEditingController();
    // _getProfileBloc.add(const RefreshProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return buildCreatePinWidget(context);
    return buildPinWidget(context, "");

    // return BlocListener<GetProfileBloc, GetProfileState>(
    //   bloc: _getProfileBloc,
    //   listener: (context, state) {
    //     if (state is GetProfileLoaded) {
    //       _controller = TextEditingController();
    //     }
    //   },
    //   child: ScaffoldWidget(
    //     useSingleScroll: false,
    //     body: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         VSpace(20),
    //         BlocBuilder<GetProfileBloc, GetProfileState>(
    //           bloc: _getProfileBloc,
    //           builder: (context, state) {
    //             // LoggerHelper.log(state);
    //
    //             if (state is GetProfileLoading || state is GetProfileRefresh) {
    //               return const Center(
    //                 child: LoadingIndicatorWidget(size: Size(30, 30)),
    //               );
    //             } else if (state is GetProfileLoaded) {
    //               final String? hashedPin =
    //                   state.profileDetailEntity.data.hashedPin;
    //               if (hashedPin == null) {
    //                 return buildCreatePinWidget(context);
    //               }
    //
    //               return buildPinWidget(context, hashedPin);
    //             } else if (state is GetProfileError) {
    //               return CustomErrorWidget(
    //                 message: state.message,
    //                 callback: () => _getProfileBloc.add(
    //                   const GetProfileEvent(),
    //                 ),
    //               );
    //             } else {
    //               return const SizedBox.shrink();
    //             }
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget buildPinWidget(BuildContext context, String hashedPin) {
    return Flexible(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        TextWidget(
          "Enter your PIN",
          size: sp(16),
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
        TextWidget(
          "Enter Your Pin To Continue Transaction",
          size: sp(14),
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
          withOpacity: 0.5,
        ),
        const VSpace(30),
        SizedBox(
          width: sw(55),
          child: AbsorbPointer(
            absorbing: true,
            child: PinCodeTextField(
              controller: _controller,
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(sr(8)),
                fieldHeight: h(56),
                fieldWidth: w(48),
                activeColor: const Color(0xFFF5F6F6),
                activeFillColor: context.isDarkMode
                    ? Colors.transparent
                    : const Color(0xFFF5F6F6),
                selectedColor: kcSecondaryColor,
                selectedFillColor: const Color(0xFFF5F6F6),
                inactiveColor: Colors.grey.withOpacity(
                  context.isDarkMode ? 0.1 : 0.1,
                ),
                inactiveFillColor: const Color(0xFFF5F6F6),
              ),
              onCompleted: (_) => AppRouter.instance.goBack(
                _controller.text,
              ),
            ),
          ),
        ),
        // const Spacer(),
        const VSpace(40),
        KeyPad(
          pinController: _controller,
          onBioMetricPressed: () => _onBiometricPressed(hashedPin),
          showBioMetric: false, //widget.showBiometric,
        ),
        const VSpace(25),
        GestureDetector(
          onTap: () {},
          child: TextWidget(
            "Forgot Pin?",
            size: sp(16),
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
        ),
      ]),
    );
  }

  Future<void> _onBiometricPressed(String hashedPin) async {
    try {
      if (await authLocalStorageDataSourceImp.canUseThumbPrint()) {
        final result =
            authLocalStorageDataSourceImp.authenticateWithBioMetric();

        if (await result == false) return;
        AppRouter.instance.goBack(hashedPin.toString());
      }
    } catch (e) {
      SnackBarService.showErrorSnackBar(
        context: context,
        message: "Failed to authenticate",
      );
    }
  }

  Widget buildCreatePinWidget(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const VSpace(),
          SizedBox(
            width: sw(70),
            child: const TextWidget(
              "It seems you have not set your transaction pin yet. Please set your transaction pin to continue",
              size: 16,
              textAlign: TextAlign.center,
            ),
          ),
          const VSpace(40),
          Button(
            text: "Create Transaction Pin",
            onTap: () => AppRouter.instance.navigateTo(
              "CreatePinView.routeName",
            ),
          ),
          const VSpace(45),
        ],
      ),
    );
  }
}
