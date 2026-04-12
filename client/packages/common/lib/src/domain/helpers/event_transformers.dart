import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rxdart/rxdart.dart';

EventTransformer<E> debounceSequential<E>(Duration duration) {
  return (events, mapper) {
    return sequential<E>().call(events.debounceTime(duration), mapper);
  };
}

EventTransformer<E> throttleTime<E>(Duration duration) {
  return (events, mapper) {
    return events
        .throttleTime(duration, leading: true, trailing: true)
        .transform(IgnoreEqualEventsTransformer())
        .switchMap(mapper);
  };
}

final class IgnoreEqualEventsTransformer<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    T? lastEvent;
    return stream.transform(
      StreamTransformer<T, T>.fromHandlers(
        handleData: (event, sink) {
          if (event != lastEvent) {
            sink.add(event);
          }
          lastEvent = event;
        },
      ),
    );
  }
}
