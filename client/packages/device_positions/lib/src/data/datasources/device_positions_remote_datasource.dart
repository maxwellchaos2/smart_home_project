import 'package:common/common.dart';
import 'package:device_positions/src/data/clients/clients.dart';
import 'package:device_positions/src/data/data.dart';
import 'package:device_positions/src/domain/domain.dart';
import 'package:dio/dio.dart';

abstract interface class IDevicePositionsRemoteDatasource {
  Future<List<DevicePositionEntity>> fetchAll();
}

final class DevicePositionsRemoteDatasourceImpl
    implements IDevicePositionsRemoteDatasource {
  const DevicePositionsRemoteDatasourceImpl(
      {required DevicePositionsApiClient client})
      : _client = client;

  final DevicePositionsApiClient _client;

  @override
  Future<List<DevicePositionEntity>> fetchAll() async {
    try {
      final data = await _client.fetchAll();
      return data.map((e) => DevicePositionMapper.toEntity(from: e)).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.toFailure(e);
    }
  }
}
