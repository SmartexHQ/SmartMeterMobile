import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  final bool success;
  final BaseDataEntity data;

  const BaseEntity({
    required this.success,
    required this.data,
  });

  @override
  List<Object?> get props => [success, data];
}

class BaseDataEntity extends Equatable {
  final String message;
  final String? token;
  final String? scope;

  const BaseDataEntity({
    required this.message,
    this.token,
    this.scope,
  });

  @override
  List<Object?> get props => [message, token, scope];
}

class PaginationEntity extends Equatable {
  const PaginationEntity({
    required this.hasPrevious,
    required this.prevPage,
    required this.hasNext,
    required this.next,
    required this.currentPage,
    required this.pageSize,
    required this.lastPage,
    required this.total,
  });

  final bool hasPrevious;
  final int prevPage;
  final bool hasNext;
  final int next;
  final int currentPage;
  final int pageSize;
  final int lastPage;
  final int total;

  @override
  List<Object?> get props => [
        hasPrevious,
        prevPage,
        hasNext,
        next,
        currentPage,
        pageSize,
        lastPage,
        total,
      ];
}

///

class BaseModel extends BaseEntity {
  const BaseModel({
    required super.success,
    required BaseDataModel super.data,
  });

  factory BaseModel.fromMap(Map<String, dynamic> json) {
    return BaseModel(
      success: json['success'] ?? false,
      data: BaseDataModel.fromMap(json['data']),
    );
  }
}

final class BaseDataModel extends BaseDataEntity {
  const BaseDataModel({
    required super.message,
    super.token,
    super.scope,
  });

  factory BaseDataModel.fromMap(Map<String, dynamic> json) {
    return BaseDataModel(
      message: json['message'] ?? "---",
      token: json['access']?['token'] as String?,
      scope: json['access']?['scope'] as String?,
    );
  }
}

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    required super.hasPrevious,
    required super.prevPage,
    required super.hasNext,
    required super.next,
    required super.currentPage,
    required super.pageSize,
    required super.lastPage,
    required super.total,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> json) {
    return PaginationModel(
      hasPrevious: json['hasPrevious'] ?? false,
      prevPage: json['prevPage'] ?? 0,
      hasNext: json['hasNext'] ?? false,
      next: json['next'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      lastPage: json['lastPage'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}
