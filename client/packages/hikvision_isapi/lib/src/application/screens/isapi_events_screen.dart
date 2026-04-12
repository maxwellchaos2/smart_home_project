import 'package:common/common.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';

class IsapiEventsScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const IsapiEventsScreen({
    super.key,
    required this.accessInfo,
  });

  final AccessInfoInputEntity accessInfo;

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        IsapiEventsScope(accessInfo: accessInfo),
      ],
      child: this,
    );
  }

  @override
  State<IsapiEventsScreen> createState() => _IsapiEventsScreenState();
}

class _IsapiEventsScreenState extends State<IsapiEventsScreen> {
  @override
  void initState() {
    super.initState();
    IsapiEventsScope.of(context).paginate();
  }

  @override
  Widget build(BuildContext context) {
    final state = IsapiEventsScope.of(context, listen: true).state;
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'События устройства',
        ),
        actions: [
          IconButton(
            onPressed: () => IsapiEventsScope.of(context).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: LoadingMoreScrollView(
          loadMore: IsapiEventsScope.of(context).paginate,
          isLoading: state.isLoading,
          hasMore: state.hasMore,
          physics: ClampingScrollPhysics(),
          slivers: [
            if (state.hasData)
              SliverPadding(
                padding: AppPaddings.horizontal.copyWith(top: 10, bottom: 30),
                sliver: state.data!.isEmpty
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                            child: Text(
                              context.l10n.empty,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = state.data![index];
                            final child = IsapiEventRow(event: item);
                            late final bool showDate;
                            if (index == 0) {
                              showDate = true;
                            } else {
                              final previousOrder = state.data![index - 1];
                              showDate = item.dateTime.toDayMouthYearFormat() !=
                                  previousOrder.dateTime.toDayMouthYearFormat();
                            }
                            if (showDate) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Text(
                                      item.dateTime.toDayMouthYearFormat(),
                                      style: TextStyle(color: Colors.grey)
                                          .reverseMerge(
                                              context.textTheme.bodySmall),
                                    ),
                                  ),
                                  child
                                ],
                              );
                            }
                            return child;
                          },
                          childCount: state.data!.length,
                        ),
                      ),
              )
            else
              SliverFillRemaining(
                hasScrollBody: false,
                child: state.maybeMap(
                  orElse: () => const LoadingBody(),
                  failure: (state) => ErrorBody(
                    message: state.failure.message,
                    onRetry: IsapiEventsScope.of(context).paginate,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
