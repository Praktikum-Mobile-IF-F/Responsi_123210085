import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfilePageStf();
  }
}

class ProfilePageStf extends StatefulWidget {
  const ProfilePageStf({super.key});

  @override
  State<ProfilePageStf> createState() => _ProfilePageStfState();
}

class _ProfilePageStfState extends State<ProfilePageStf> {
  String username = '';
  String password = '';

  Future<void> getPreferences() async {
    final jembatan = await SharedPreferences.getInstance();
    if (jembatan.containsKey('myData')) {
      final myData =
          jsonDecode(jembatan.getString('myData')!) as Map<String, dynamic>;
      setState(() {
        username = myData['username'];
        password = myData['password'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('halaman profile'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(),
          Text('Username = $username'),
          Text('Password = $password'),
        ],
      ),
    );
  }
}
