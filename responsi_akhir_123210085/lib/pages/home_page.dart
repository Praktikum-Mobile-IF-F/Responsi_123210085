import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsi_123210085/pages/detail_page.dart';
import 'package:responsi_123210085/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: HomePageStf());
  }
}

class HomePageStf extends StatefulWidget {
  const HomePageStf({super.key});

  @override
  State<HomePageStf> createState() => _HomePageStfState();
}

class _HomePageStfState extends State<HomePageStf> {
  List<dynamic> dataImport = [];
  String namaKopi = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fake-coffee-api.vercel.app/api'));

    if (response.statusCode == 200) {
      setState(() {
        dataImport = json.decode(response.body);
      });
      print(dataImport.length);
      print(dataImport[0]['name']);
    } else {
      throw Exception('failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: const Color.fromARGB(255, 135, 9, 0),
          foregroundColor: Colors.white,
          leading: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: CircleAvatar()),
        ),
        body: dataImport.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  namaKopi = dataImport[index]['name'];
                  return ListTile(
                    title: Text(namaKopi),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    dataImport: dataImport[index],
                                  )));
                    },
                    leading: Checkbox(
                      onChanged: (value) {
                        setState(() {});
                      },
                      value: true,
                    ),
                  );
                },
                itemCount: dataImport.length,
              ));
  }
}
