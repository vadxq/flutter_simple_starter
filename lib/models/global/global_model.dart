import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_model.freezed.dart';
part 'global_model.g.dart';

@freezed
class GlobalModel with _$GlobalModel {
  const factory GlobalModel({
    required String token,
    required String freshToken,
    required String username,
    required int userId,
  }) = _GlobalModel;

  factory GlobalModel.fromJson(Map<String, Object?> json) =>
      _$GlobalModelFromJson(json);
}
