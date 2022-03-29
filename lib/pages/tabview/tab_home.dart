import 'package:dealsapp/pages/tabview/dynamic_gridview.dart';
import 'package:dealsapp/pages/tabview/general_gridview.dart';
import 'package:dealsapp/pages/tabview/sliver_gridview.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
  int _selectedIndex = 0;

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
                borderRadius: BorderRadius.circular(Sizes.radius_0),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(Sizes.radius_0),
          //   topRight: Radius.circular(Sizes.radius_0),
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: Sizes.SIZE_16,
              spreadRadius: Sizes.SIZE_0,
              offset: Offset(Sizes.SIZE_0, Sizes.SIZE_0),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.SIZE_16,
              vertical: Sizes.SIZE_8,
            ),
            child: GNav(
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.redAccent,
              gap: Sizes.SIZE_8,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.SIZE_16,
                vertical: Sizes.SIZE_8,
              ),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              rippleColor: Colors.grey[300]!,
              iconSize: Sizes.iconSize_24,
              tabs: const [
                GButton(icon: Icons.home, text: StringConstant.HOME),
                GButton(icon: Icons.search, text: StringConstant.SEARCH),
                GButton(icon: Icons.favorite, text: StringConstant.FAVORITE),
                GButton(icon: Icons.person, text: StringConstant.PROFILE),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
