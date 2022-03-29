import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:dealsapp/pages/shimmer_loading.dart/shimmer_1.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingListPage extends StatefulWidget {
  const ShimmerLoadingListPage({Key? key}) : super(key: key);

  @override
  State<ShimmerLoadingListPage> createState() => _ShimmerLoadingListPageState();
}

class _ShimmerLoadingListPageState extends State<ShimmerLoadingListPage> {
  // initializing the global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    // API Loading and other pre loaded data access
    super.initState();
  }

  @override
  void dispose() {
    // dispose the API loading and other pre loaded data access
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        children: [
          Container(
            child: const Text(
              'Shimmer Loading',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_16,
          ),
          Container(
            child: const Text(
              'Shimmer Loading List',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_16,
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Shimmer Loading 0',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Shimmer Loading 1',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Shimmer Loading 2',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Shimmer Loading 3',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Shimmer Loading 4',
            page: const ShimmerLoadingPage1(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Shimmer Loading 5',
            page: const ShimmerLoadingPage1(),
          ),
        ],
      ),
    );
  }
}
