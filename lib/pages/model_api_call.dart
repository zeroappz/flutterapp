import 'dart:convert';

import 'package:dealsapp/model/user_model.dart';
import 'package:dealsapp/util/api_service.dart';
import 'package:flutter/material.dart';

class MVSAccess extends StatefulWidget {
  const MVSAccess({Key? key}) : super(key: key);

  @override
  State<MVSAccess> createState() => _MVSAccessState();
}

class _MVSAccessState extends State<MVSAccess> {
  List<UserCRMModel> _users = [];

  @override
  void initState() {
    /// API calls
    // getUserDetailsApi();
    getUserDetailsAnotherWayApi();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC Pattern'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text("Client ${user.userid!}: ${user.company!}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getUserDetailsAnotherWayApi,
        tooltip: 'Fetch Users',
        child: const Icon(Icons.data_usage),
      ),
    );
  }

  Future<void> getUserDetailsApi() async {
    ApiService.getUserDetails().then((response) {
      // final List list = json.decode(response);
      setState(() {
        Iterable output = json.decode(response);
        _users = output.map((data) => UserCRMModel.fromJson(data)).toList();
        // _users = list.map((response) => UserCRMModel.fromJson(response)).toList();
      });
    });
    // getUserDetailsAnotherWay
  }

  Future<void> getUserDetailsAnotherWayApi() async {
    ApiService.getUserDetailsAnotherWay().then((response) {
      // final List list = json.decode(response);
      setState(() {
        Iterable output = json.decode(response);
        _users = output.map((data) => UserCRMModel.fromJson(data)).toList();
        // _users = list.map((response) => UserCRMModel.fromJson(response)).toList();
      });
    });
  }
}
