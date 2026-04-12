import 'package:flutter/material.dart';

import '../domain.dart';

abstract interface class ICameraArchiveController {
  CameraArchiveState get state;

  void searchRecordings({required DateTime date});

  void selectTime({required TimeOfDay time});

  void updatePlaybackPosition({required Duration position});
}

final class CameraArchiveControllerImpl implements ICameraArchiveController {
  final CameraArchiveBloc _bloc;
  const CameraArchiveControllerImpl({required CameraArchiveBloc bloc})
      : _bloc = bloc;

  @override
  CameraArchiveState get state => _bloc.state;

  @override
  void searchRecordings({required DateTime date}) =>
      _bloc.add(CameraArchiveEvent.searchRecordings(date: date));

  @override
  void selectTime({required TimeOfDay time}) =>
      _bloc.add(CameraArchiveEvent.selectTime(time: time));

  @override
  void updatePlaybackPosition({required Duration position}) =>
      _bloc.add(CameraArchiveEvent.updatePlaybackPosition(position: position));
}
