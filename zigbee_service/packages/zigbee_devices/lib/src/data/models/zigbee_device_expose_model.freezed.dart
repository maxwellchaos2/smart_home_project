// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_expose_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZigbeeDeviceExposeModel {
  /// Категория возможности
  String? get category;

  /// Описание возможности
  String? get description;

  /// Уровень доступа к возможности (например, 1 - read, 2 - write, 3 - read/write, 5 - notify)
  int? get access;

  /// Метка возможности
  String? get label;

  /// Имя возможности
  String? get name;

  /// Свойство возможности
  String? get property;

  /// Тип возможности (например, numeric, enum, binary и т.д.)
  String? get type;

  /// Максимальное значение (если применимо, для типа numeric)
  int? get valueMax;

  /// Минимальное значение (если применимо, для типа numeric)
  int? get valueMin;

  /// Шаг изменения значения (если применимо, для типа numeric)
  double? get valueStep;

  /// Единица измерения (если применимо, для типа numeric)
  String? get unit;

  /// Список возможных значений (если применимо, для типа enum)
  List<String>? get values;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZigbeeDeviceExposeModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.valueMax, valueMax) ||
                other.valueMax == valueMax) &&
            (identical(other.valueMin, valueMin) ||
                other.valueMin == valueMin) &&
            (identical(other.valueStep, valueStep) ||
                other.valueStep == valueStep) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      description,
      access,
      label,
      name,
      property,
      type,
      valueMax,
      valueMin,
      valueStep,
      unit,
      const DeepCollectionEquality().hash(values));

  @override
  String toString() {
    return 'ZigbeeDeviceExposeModel(category: $category, description: $description, access: $access, label: $label, name: $name, property: $property, type: $type, valueMax: $valueMax, valueMin: $valueMin, valueStep: $valueStep, unit: $unit, values: $values)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _ZigbeeDeviceExposeModel extends ZigbeeDeviceExposeModel {
  const _ZigbeeDeviceExposeModel(
      {this.category,
      required this.description,
      required this.access,
      required this.label,
      required this.name,
      required this.property,
      required this.type,
      this.valueMax,
      this.valueMin,
      this.valueStep,
      this.unit,
      final List<String>? values})
      : _values = values,
        super._();
  factory _ZigbeeDeviceExposeModel.fromJson(Map<String, dynamic> json) =>
      _$ZigbeeDeviceExposeModelFromJson(json);

  /// Категория возможности
  @override
  final String? category;

  /// Описание возможности
  @override
  final String? description;

  /// Уровень доступа к возможности (например, 1 - read, 2 - write, 3 - read/write, 5 - notify)
  @override
  final int? access;

  /// Метка возможности
  @override
  final String? label;

  /// Имя возможности
  @override
  final String? name;

  /// Свойство возможности
  @override
  final String? property;

  /// Тип возможности (например, numeric, enum, binary и т.д.)
  @override
  final String? type;

  /// Максимальное значение (если применимо, для типа numeric)
  @override
  final int? valueMax;

  /// Минимальное значение (если применимо, для типа numeric)
  @override
  final int? valueMin;

  /// Шаг изменения значения (если применимо, для типа numeric)
  @override
  final double? valueStep;

  /// Единица измерения (если применимо, для типа numeric)
  @override
  final String? unit;

  /// Список возможных значений (если применимо, для типа enum)
  final List<String>? _values;

  /// Список возможных значений (если применимо, для типа enum)
  @override
  List<String>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZigbeeDeviceExposeModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.valueMax, valueMax) ||
                other.valueMax == valueMax) &&
            (identical(other.valueMin, valueMin) ||
                other.valueMin == valueMin) &&
            (identical(other.valueStep, valueStep) ||
                other.valueStep == valueStep) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      description,
      access,
      label,
      name,
      property,
      type,
      valueMax,
      valueMin,
      valueStep,
      unit,
      const DeepCollectionEquality().hash(_values));

  @override
  String toString() {
    return 'ZigbeeDeviceExposeModel(category: $category, description: $description, access: $access, label: $label, name: $name, property: $property, type: $type, valueMax: $valueMax, valueMin: $valueMin, valueStep: $valueStep, unit: $unit, values: $values)';
  }
}

// dart format on
