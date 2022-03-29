import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:dealsapp/pages/login.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingPage1 extends StatefulWidget {
  const ShimmerLoadingPage1({Key? key}) : super(key: key);

  @override
  State<ShimmerLoadingPage1> createState() => _ShimmerLoadingPage1State();
}

class _ShimmerLoadingPage1State extends State<ShimmerLoadingPage1> {
  // initializing the global widget
  final _globalWidget = GlobalWidget();
  final Color shimmerColor = Colors.grey[200]!;

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
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Shimmer Loading Effect 1',
                description:
                    'This is just an Example of Shimmer Loading Effect 1'),
          ),
          buildShimmer(),
        ],
      ),
    );
  }

  Widget buildShimmer() {
    return ListView.builder(
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300]!,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          color: shimmerColor,
                        ),
                        height: 120,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 80.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              padding: const EdgeInsets.only(left: 14.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: shimmerColor,
                              ),
                              height: 20.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: shimmerColor,
                              ),
                              height: 20.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                period: const Duration(milliseconds: 1200),
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 20.0), height: 1.0),
          ],
        );
      },
    );
  }
}
