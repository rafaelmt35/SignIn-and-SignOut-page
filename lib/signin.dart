import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/main.dart';
import 'package:signin_signup/singup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 15,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(278))),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(278))),
          ),
          bottom: PreferredSize(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              preferredSize: Size.fromHeight(190)),
        ),
        body: Form(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (val) {
                    return val!.isEmpty ? "Enter your email" : null;
                  },
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (val) {
                    return val!.isEmpty ? "Enter your password" : null;
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: signInfirebase,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(30)),
                    width: MediaQuery.of(context).size.width - 48,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account? ",
                        style: TextStyle(fontSize: 15)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            color: Colors.blue.shade800),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future signInfirebase() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
