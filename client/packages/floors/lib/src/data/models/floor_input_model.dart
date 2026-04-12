import 'package:common/common.dart';

part 'floor_input_model.freezed.dart';
part 'floor_input_model.g.dart';

@Freezed(toJson: true)
sealed class FloorInputModel with _$FloorInputModel {
  const FloorInputModel._();

  const factory FloorInputModel({
    required String name,
  }) = _FloorInputModel;

  @override
  Map<String, dynamic> toJson();
}
