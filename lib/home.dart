import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    final useremail = FirebaseAuth.instance.currentUser!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
      ),
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Logged in as:',style: TextStyle(fontSize: 18.0),),
                Text(useremail.email!,style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  height: 50,
                  width: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
