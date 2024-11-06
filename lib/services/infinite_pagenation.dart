import '../core.dart';

class InfiniteScrollPaginationBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool hasMore;
  final Future<void> Function() onLoading;

  const InfiniteScrollPaginationBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.hasMore,
    required this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onLoading();
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

class InfiniteScrollGridPaginationBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool hasMore;
  final Future<void> Function() onLoading;

  const InfiniteScrollGridPaginationBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.hasMore,
    required this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onLoading();
      }
    });

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      controller: scrollController,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
