import 'package:common/common.dart';
import 'package:events/src/domain/domain.dart';

class EventsScope extends SingleChildStatefulWidget {
  const EventsScope({super.key, super.child});

  @override
  State<EventsScope> createState() => _EventsScopeState();
}

class _EventsScopeState extends SingleChildState<EventsScope> {
  late final IEventsRepository _eventsRepository;

  @override
  void initState() {
    super.initState();
    _eventsRepository = context.locator.get<IEventsRepository>();
    _eventsRepository.init();
  }

  @override
  void dispose() {
    _eventsRepository.dispose();
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return child!;
  }
}
