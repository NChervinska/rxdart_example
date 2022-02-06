import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError extends Equatable {
  final String error;

  const ApiError({
    required this.error,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return _$ApiErrorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  List<Object?> get props {
    return [
      error,
    ];
  }
}
