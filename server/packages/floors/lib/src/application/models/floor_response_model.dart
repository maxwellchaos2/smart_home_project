import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_response_model.freezed.dart';
part 'floor_response_model.g.dart';

@Freezed(toJson: true)
class FloorResponseModel with _$FloorResponseModel {
  const FloorResponseModel._();

  const factory FloorResponseModel({
    required int id,
    required String name,
    required int projectId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String? planMediaPath,
  }) = _FloorResponseModel;

  @override
  Map<String, dynamic> toJson();
}
