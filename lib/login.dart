import 'package:flutter/material.dart';
import 'hotel.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset('assets/images/Frame 11.png'),
        Image.asset('assets/images/Frame 12.png'),
        Text('LOGIN',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.white)),
        Text('Email Address'),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: _usernameController,
            style: TextStyle(color: Color.fromARGB(255, 161, 51, 51)),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:242620087.
        ),
        Text('Password'),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(color: Color.fromARGB(255, 161, 51, 51)),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:242620087.
        ),
        ElevatedButton(
            onPressed: (() {
              String username = _usernameController.text;
              Navigator.pushNamed(context, '/home', arguments: username);
            }),
            child: Text('LOGIN')),
      ]),
    );
  }
}
