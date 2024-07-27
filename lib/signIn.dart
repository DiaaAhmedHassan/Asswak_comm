
import 'package:asswak_comm/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignIn extends StatefulWidget {
  late SharedPreferences prefs;

  bool isUserSignIn = false;
  bool isPasswordVisible = false;

  SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Asswak ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "comm ",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "images/cartLogo.png",
                  width: 150,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.green,), borderRadius: BorderRadius.circular(10)),
                    floatingLabelStyle: const TextStyle(color: Colors.green),
                    prefixIcon: const Icon(Icons.email),
                    label: const Text("Email"),
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !widget.isPasswordVisible,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.green,), borderRadius: BorderRadius.circular(10)),
                    floatingLabelStyle: const TextStyle(color: Colors.green),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon:  Icon(widget.isPasswordVisible?Icons.visibility_outlined:Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          widget.isPasswordVisible = !widget.isPasswordVisible;
                        });
                      },
                    ),
                    label: const Text("Password"),
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  child: MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      logIn(context);
                      
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, signUpPage);
                      },
                      child: const Text("Sign up",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void logIn(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("is signed in", true);
  
  Navigator.pushNamed(context, homePage);
}