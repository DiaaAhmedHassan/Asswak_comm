import 'package:asswak_comm/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  bool isPasswordVisible = false;
  bool isConfirmationVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  const Text(
                    "Registration",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        widget.emailController.text = val!;
                      });
                    },
                    
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10)),
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
                    onSaved: (val) {
                      setState(() {
                        widget.usernameController.text = val!;
                      });
                    },
                    controller: widget.usernameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      floatingLabelStyle: const TextStyle(color: Colors.green),
                      prefixIcon: const Icon(Icons.person),
                      label: const Text("Username"),
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
                    controller: widget.phoneNumberController,
                    onSaved: (val) {
                      setState(() {
                        widget.phoneNumberController.text = val!;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      floatingLabelStyle: const TextStyle(color: Colors.green),
                      prefixIcon: const Icon(Icons.call),
                      label: const Text("Phone number"),
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
                    controller: widget.passwordController,
                    onSaved: (val) {
                      setState(() {
                        widget.passwordController.text = val!;
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !widget.isConfirmationVisible,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      floatingLabelStyle: const TextStyle(color: Colors.green),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(widget.isConfirmationVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            widget.isConfirmationVisible =
                                !widget.isConfirmationVisible;
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
                  TextFormField(
                    controller: widget.passwordConfirmationController,
                      onSaved: (val){
                      setState(() {
                        widget.passwordConfirmationController.text = val!;
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !widget.isPasswordVisible,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      floatingLabelStyle: const TextStyle(color: Colors.green),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(widget.isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            widget.isPasswordVisible =
                                !widget.isPasswordVisible;
                          });
                        },
                      ),
                      label: const Text("Confirm Password"),
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
                      onPressed: () async {
                        widget.formKey.currentState!.save();
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("email", widget.emailController.text);
                        prefs.setString("username", widget.usernameController.text);
                        prefs.setString("phone", widget.phoneNumberController.text);
                        prefs.setString("password", widget.passwordController.text);

                        prefs.setBool("is signed in", true);

                        Navigator.pushReplacementNamed(context, homePage);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, signInPage);
                        },
                        child: const Text("Sign in",
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
      ),
    );
  }
}
