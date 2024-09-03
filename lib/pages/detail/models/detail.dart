import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

@freezed
class Detail with _$Detail {
  factory Detail({
    required String title,
    required int id,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
