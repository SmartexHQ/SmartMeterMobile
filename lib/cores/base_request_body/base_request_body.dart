import 'package:equatable/equatable.dart';

abstract class RequestParam extends Equatable {
  const RequestParam();

  Map<String, dynamic> toMap();
}
