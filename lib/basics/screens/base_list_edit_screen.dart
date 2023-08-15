import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samewise/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/loading_function.dart';
import 'package:flutter_samewise/widgets/custom/custom_text.dart';
import 'package:flutter_samewise/widgets/wrong_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

abstract class BaseListEditScreen<T> extends CoreStatefulWidget {
  final PageName pageName;
  final int length;
  final String noItemFoundMessage;
  final String title;
  final Widget Function(BuildContext, Widget?) editPageBuilder;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const BaseListEditScreen(
    this.pageName, {
    this.length = 50,
    required this.noItemFoundMessage,
    required this.title,
    required this.editPageBuilder,
    required this.itemBuilder,
    super.key,
  });

  void initState();
  Future<List<T>> nextPage(int page, BuildContext context);

  @override
  CoreStatefulWidgetState<BaseListEditScreen<T>> createState() =>
      _BaseListEditScreenState();
}

class _BaseListEditScreenState<T>
    extends CoreStatefulWidgetState<BaseListEditScreen<T>> {
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);

  late int page;

  @override
  void initState() {
    page = 0;

    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 0) page = 0;
      _fetchPage(pageKey);
    });

    widget.initState();
    super.initState();
  }

  Future<void> _fetchPage(pageKey) async {
    try {
      List<T> newItems = await widget.nextPage(page, context);

      final isLastPage = newItems.length < widget.length;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        page++;
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PagingController<int, T>>(
      create: (_) => _pagingController,
      builder: (context, child) {
        return KeyboardDismisser(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: CustomText(widget.title, fontSize: 20),
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              actions: [
                Consumer<PagingController<int, T>>(
                  builder: (context, pageController, child) {
                    return IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: pageController,
                              builder: widget.editPageBuilder,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_circle_outline, size: 28),
                    );
                  },
                ),
              ],
            ),
            body: Consumer<PagingController<int, T>>(
                builder: (context, pagingController, _) {
              return RefreshIndicator.adaptive(
                onRefresh: () => Future.sync(
                  () => pagingController.refresh(),
                ),
                child: PagedListView(
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<T>(
                    itemBuilder: widget.itemBuilder,
                    firstPageProgressIndicatorBuilder: (context) => Center(
                      child: LoadingFunction.loadingSquareCircle(context),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: WrongWidget(widget.noItemFoundMessage),
                    ),
                    newPageProgressIndicatorBuilder: (context) => const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    firstPageErrorIndicatorBuilder: (context) => const Center(
                      child: WrongWidget("Terjadi Kesalahan Pada Server"),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
