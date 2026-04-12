import 'package:common/common.dart';

part 'floor_input_model.freezed.dart';
part 'floor_input_model.g.dart';

@Freezed(toJson: true)
sealed class FloorInputModel with _$FloorInputModel {
  const FloorInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FloorInputModel({
    required String name,
    required int projectId,
    required String? planMediaPath,
  }) = _FloorInputModel;

  @override
  Map<String, dynamic> toJson();
}
