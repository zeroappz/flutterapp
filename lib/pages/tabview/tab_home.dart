import 'package:dealsapp/pages/tabview/dynamic_gridview.dart';
import 'package:dealsapp/pages/tabview/general_gridview.dart';
import 'package:dealsapp/pages/tabview/sliver_gridview.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({
    Key? key,
  }) : super(key: key);

  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  bool _generalTabActive = true;
  bool _dynamicTabActive = false;
  bool _sliverTabActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(StringConstant.GALLERY.toUpperCase(),
            style: const TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                left: Sizes.SIZE_0,
                right: Sizes.SIZE_0,
                top: Sizes.SIZE_0,
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
                bottom: 0.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.RADIUS_0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _generalTabActive = true;
                        _dynamicTabActive = false;
                        _sliverTabActive = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: _generalTabActive == true
                            ? const Border(
                                bottom: BorderSide(
                                  color: Colors.redAccent,
                                  width: Sizes.SIZE_4,
                                  style: BorderStyle.solid,
                                ),
                              )
                            : null,
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          Text(
                            StringConstant.GENERAL_TAB,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _generalTabActive = false;
                        _dynamicTabActive = true;
                        _sliverTabActive = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: _dynamicTabActive == true
                            ? const Border(
                                bottom: BorderSide(
                                  color: Colors.redAccent,
                                  width: Sizes.SIZE_4,
                                  style: BorderStyle.solid,
                                ),
                              )
                            : null,
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.cabin,
                            color: Colors.black,
                          ),
                          Text(
                            StringConstant.DYNAMIC_TAB,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _generalTabActive = false;
                        _dynamicTabActive = false;
                        _sliverTabActive = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: _sliverTabActive == true
                            ? const Border(
                                bottom: BorderSide(
                                  color: Colors.redAccent,
                                  width: Sizes.SIZE_4,
                                  style: BorderStyle.solid,
                                ),
                              )
                            : null,
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.dynamic_feed,
                            color: Colors.black,
                          ),
                          Text(
                            StringConstant.SLIVE_TAB,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.SIZE_16,
                  right: Sizes.SIZE_16,
                  top: Sizes.SIZE_0,
                  bottom: Sizes.SIZE_0,
                ),
                child: _generalTabActive == true
                    ? const GeneralGridView()
                    : _dynamicTabActive == true
                        ? const DynamicGridView()
                        : _sliverTabActive == true
                            ? const SliverGridView()
                            : null),
          ),
        ],
      ),
    );
  }
}
