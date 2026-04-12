import 'dart:math';

import 'package:common/common.dart';

final class LoadingMoreScrollView extends StatefulWidget {
  const LoadingMoreScrollView({
    super.key,
    required this.loadMore,
    required this.isLoading,
    required this.hasMore,
    this.controller,
    required this.slivers,
    this.reverse = false,
    this.physics,
  });

  final void Function() loadMore;
  final bool isLoading;
  final bool hasMore;
  final List<Widget> slivers;
  final ScrollController? controller;
  final bool reverse;
  final ScrollPhysics? physics;

  @override
  State<LoadingMoreScrollView> createState() => _LoadingMoreScrollViewState();
}

class _LoadingMoreScrollViewState extends State<LoadingMoreScrollView> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        max(10, _scrollController.position.maxScrollExtent - 50)) {
      if (widget.hasMore && !widget.isLoading) {
        widget.loadMore();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: widget.physics,
      controller: _scrollController,
      reverse: widget.reverse,
      slivers: [
        if (!widget.reverse) ...widget.slivers,
        if (widget.isLoading)
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        if (widget.reverse) ...widget.slivers,
      ],
    );
  }
}
