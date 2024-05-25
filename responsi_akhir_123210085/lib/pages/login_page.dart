import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsi_123210085/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: LoginPageStf());
  }
}

class LoginPageStf extends StatefulWidget {
  const LoginPageStf({super.key});

  @override
  State<LoginPageStf> createState() => _LoginPageStfState();
}

class _LoginPageStfState extends State<LoginPageStf> {
  String username = '';
  String password = '';
  String usernameCek = '';
  String passwordCek = '';

  void cektext() {
    print('username = $username');
    print('pasword = $password');
    print('user = $usernameCek');
    print('pass = $passwordCek');
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    cektext();
  }

  Future<void> setPreferences() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      jembatan.clear();
    }
    final myData = json.encode({
      'username': username,
      'password': password,
    });
    jembatan.setString('myData', myData);
    cektext();
  }

  Future<void> getPreferences() async {
    final jembatan = await SharedPreferences.getInstance();
    if (jembatan.containsKey('myData')) {
      final myData =
          jsonDecode(jembatan.getString('myData')!) as Map<String, dynamic>;
      setState(() {
        usernameCek = myData['username'];
        passwordCek = myData['password'];
      });
      cektext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: const Color.fromARGB(255, 135, 9, 0),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _usernameField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 16),
            _buttonLogin(),
            const SizedBox(height: 16),
            _textButtonRegister()
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
      decoration: const InputDecoration(
          hintText: 'username',
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.black),
          )),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      enabled: true,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      decoration: const InputDecoration(
          hintText: 'pasword',
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.black),
          )),
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
        onPressed: () {
          cektext();
          if (username == usernameCek && password == passwordCek) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('akun salah')));
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 126, 0, 0),
            foregroundColor: Color.fromARGB(255, 2555, 2555, 255)),
        child: const Text('Login'));
  }

  Widget _textButtonRegister() {
    return TextButton(
        onPressed: () {
          setPreferences();
          getPreferences();
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.red,
        ),
        child: const Text('Register Disini'));
  }
}
