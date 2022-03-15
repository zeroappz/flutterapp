import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard'.toUpperCase(),
          style: const TextStyle(
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
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              // const UserAccountsDrawerHeader(
              //   currentAccountPicture: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     child: Icon(
              //       Icons.person,
              //       color: Colors.black,
              //     ),
              //   ),
              //   accountName: Text('John Doe'),
              //   accountEmail: Text('pravileaf@gmail.com'),
              // ),
              const SizedBox(
                height: 100.0,
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
