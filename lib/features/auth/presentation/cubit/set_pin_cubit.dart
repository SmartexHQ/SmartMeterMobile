import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmetermobile/cores/base_request_body/base_request_body.dart';
import 'package:smartmetermobile/cores/utils/formz_validator/required_formz_validator.dart';

final class SetPinCubit extends Cubit<SetPinParam> {
  SetPinCubit() : super(const SetPinParam());

  void reset() => emit(const SetPinParam());

  void onPinChanged(String pin) {
    emit(state.copyWith(pin: Required.dirty(pin)));
  }

  void onConfirmPinChanged(String confirmPin) {
    emit(state.copyWith(confirmPin: Required.dirty(confirmPin)));
  }
}

final class SetPinParam extends RequestParam {
  const SetPinParam({
    this.pin = const Required.pure(),
    this.confirmPin = const Required.pure(),
  });

  final Required pin;
  final Required confirmPin;

  bool get isValid => pin.isValid && confirmPin.isValid;

  SetPinParam copyWith({Required? pin, Required? confirmPin}) {
    return SetPinParam(
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'pin': pin.value,
      'pin_confirmation': confirmPin.value,
    };
  }

  @override
  List<Object?> get props => [pin, confirmPin];
}
