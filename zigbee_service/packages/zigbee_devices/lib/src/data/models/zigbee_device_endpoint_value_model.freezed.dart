// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_endpoint_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZigbeeDeviceEndpointValueModel {
  /// Имя конечной точки (если доступно)
  String? get name;

  /// Кластеры конечной точки
  Map<String, dynamic> get clusters;

  /// Привязки конечной точки
  List<dynamic> get bindings;

  /// Настроенные отчеты конечной точки
  List<dynamic> get configuredReportings;
  List<dynamic>? get scenes;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZigbeeDeviceEndpointValueModel &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.clusters, clusters) &&
            const DeepCollectionEquality().equals(other.bindings, bindings) &&
            const DeepCollectionEquality()
                .equals(other.configuredReportings, configuredReportings) &&
            const DeepCollectionEquality().equals(other.scenes, scenes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(clusters),
      const DeepCollectionEquality().hash(bindings),
      const DeepCollectionEquality().hash(configuredReportings),
      const DeepCollectionEquality().hash(scenes));

  @override
  String toString() {
    return 'ZigbeeDeviceEndpointValueModel(name: $name, clusters: $clusters, bindings: $bindings, configuredReportings: $configuredReportings, scenes: $scenes)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _ZigbeeDeviceEndpointValueModel extends ZigbeeDeviceEndpointValueModel {
  const _ZigbeeDeviceEndpointValueModel(
      {this.name,
      required final Map<String, dynamic> clusters,
      required final List<dynamic> bindings,
      required final List<dynamic> configuredReportings,
      final List<dynamic>? scenes})
      : _clusters = clusters,
        _bindings = bindings,
        _configuredReportings = configuredReportings,
        _scenes = scenes,
        super._();
  factory _ZigbeeDeviceEndpointValueModel.fromJson(Map<String, dynamic> json) =>
      _$ZigbeeDeviceEndpointValueModelFromJson(json);

  /// Имя конечной точки (если доступно)
  @override
  final String? name;

  /// Кластеры конечной точки
  final Map<String, dynamic> _clusters;

  /// Кластеры конечной точки
  @override
  Map<String, dynamic> get clusters {
    if (_clusters is EqualUnmodifiableMapView) return _clusters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clusters);
  }

  /// Привязки конечной точки
  final List<dynamic> _bindings;

  /// Привязки конечной точки
  @override
  List<dynamic> get bindings {
    if (_bindings is EqualUnmodifiableListView) return _bindings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bindings);
  }

  /// Настроенные отчеты конечной точки
  final List<dynamic> _configuredReportings;

  /// Настроенные отчеты конечной точки
  @override
  List<dynamic> get configuredReportings {
    if (_configuredReportings is EqualUnmodifiableListView)
      return _configuredReportings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configuredReportings);
  }

  final List<dynamic>? _scenes;
  @override
  List<dynamic>? get scenes {
    final value = _scenes;
    if (value == null) return null;
    if (_scenes is EqualUnmodifiableListView) return _scenes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZigbeeDeviceEndpointValueModel &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._clusters, _clusters) &&
            const DeepCollectionEquality().equals(other._bindings, _bindings) &&
            const DeepCollectionEquality()
                .equals(other._configuredReportings, _configuredReportings) &&
            const DeepCollectionEquality().equals(other._scenes, _scenes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_clusters),
      const DeepCollectionEquality().hash(_bindings),
      const DeepCollectionEquality().hash(_configuredReportings),
      const DeepCollectionEquality().hash(_scenes));

  @override
  String toString() {
    return 'ZigbeeDeviceEndpointValueModel(name: $name, clusters: $clusters, bindings: $bindings, configuredReportings: $configuredReportings, scenes: $scenes)';
  }
}

// dart format on
