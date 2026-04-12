library;

import 'package:common/common.dart';

export 'package:assets/assets.dart';
export 'package:auto_size_text/auto_size_text.dart';
export 'package:bloc/bloc.dart' show Bloc, Emitter;
export 'package:bloc_concurrency/bloc_concurrency.dart';
export 'package:collection/collection.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocConsumer, MultiBlocListener;
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:localization/localization.dart' show AppLocalizations;
export 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
export 'package:navigator/navigator.dart';
export 'package:provider/provider.dart';
export 'package:provider/single_child_widget.dart';
export 'package:rxdart/rxdart.dart' hide Notification;
export 'package:validation/validation.dart';

export 'src/application/application.dart';
export 'src/data/data.dart';
export 'src/di/locator.dart';
export 'src/domain/domain.dart';
export 'src/errors/failure.dart';
export 'src/extensions/extensions.dart';
export 'src/observers/observers.dart';

class ProjectIdController extends ValueNotifier<int?> {
  ProjectIdController([super.value]);
}
