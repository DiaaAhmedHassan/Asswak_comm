import 'package:asswak_comm/HomePage.dart';
import 'package:asswak_comm/SignUpPage.dart';
import 'package:asswak_comm/signIn.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


String homePage = "HomePage";
String signInPage = "Sign in page";
String signUpPage = "Sign up page";
bool isSignIn = false;



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}




class Home extends StatefulWidget{
  const Home({super.key});

  


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(scaffoldKey: scaffoldKey,),
        routes: 
        {
          signInPage: (context) => SignIn(),
          signUpPage: (context) => SignUpPage(),
          homePage: (context) => HomePage(scaffoldKey: scaffoldKey),
        },
    );
  }
}

