import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dealsapp/commonwidget/global_widget.dart';
// import 'package:dealsapp/values/sizes.dart';
// import 'package:dealsapp/values/strings.dart';
// import 'package:dealsapp/values/colors.dart';
// import 'package:dealsapp/values/images_path.dart';
// import 'package:dealsapp/values/styles.dart';

import 'package:dealsapp/values/values.dart';


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _formKey = GlobalKey<FormState>();
  int selectedIndex = 0;
  int carouselIndex = 0;
  int carouselSliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          StringConstant.DASHBOARD,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                accountName: Text('John Doe'),
                accountEmail: Text('pravileaf@gmail.com'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Container(
              height: 200.0,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: const [
                  NetworkImage(
                      'https://rukminim2.flixcart.com/flap/844/140/image/8267b3004ba09766.jpg?q=50'), // load only if we have internet connect
                  AssetImage('assets/images/banner_1.png'),
                  AssetImage('assets/images/banner_2.png'),
                  AssetImage('assets/images/banner_3.png'),
                  AssetImage('assets/images/banner_4.png'),
                  AssetImage('assets/images/banner_5.png'),
                ],
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: const Duration(milliseconds: 1000),
                dotSize: 4.0,
                dotColor: Colors.redAccent,
                indicatorBgPadding: 8.0,
                dotBgColor: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Top Categories',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          CarouselSlider.builder(
            itemCount: 2,
            itemBuilder: (context, index, item) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.network(
                    'https://rukminim2.flixcart.com/flap/844/140/image/8267b3004ba09766.jpg?q=50',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
              disableCenter: true,
              pageSnapping: true,
              onPageChanged: (index, reason) {
                setState(() {
                  carouselIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Recommended Products',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          CarouselSlider.builder(
            itemCount: 2,
            itemBuilder: (context, index, item) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.network(
                    "https://rukminim2.flixcart.com/flap/50/50/image/ad66e52876799354.jpg?q=50",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
              disableCenter: true,
              pageSnapping: true,
              onPageChanged: (index, reason) {
                setState(() {
                  carouselSliderIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: Sizes.HEIGHT_10),

          // load an image and view it as a full screen on click of that image
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FullScreenImageView(
                    Images.liveUrl,
                    StringConstant.IMG_TAG,
                  ),
                ),
              );
            },
            child: Hero(
              child: ClipRect(child: Image.network(Images.liveUrl)),
              tag: StringConstant.IMG_TAG,
            ),
          ),

        ],
      ),
    );
  }
}
