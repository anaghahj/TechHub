import 'package:flutter/material.dart';
import 'package:techub/screens/Welcomescreen.dart';
import 'package:techub/screens/singup_screen.dart';
import 'package:techub/widgets/signinsuccess.dart';

String? email1;
String? password1;

class Login extends StatefulWidget {
  static const id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisibility = false;
  String name = "";
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 208, 0),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/logo/logo.png",
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: username,
                        onChanged: (value) {
                          email1 = value;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Username",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: password,
                        onChanged: (value) {
                          password1 = value;
                        },
                        obscureText: !isVisibility,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisibility = !isVisibility;
                              });
                            },
                            icon: Icon(
                              isVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 244, 195),
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () async {
                          try {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login Successful"),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => welcome(),
                              ),
                              (route) => false,
                            );
                          } catch (e) {
                            print(e);
                          }
                          password.clear();
                          username.clear();
                        },
                        child: Text("Login"),
                      ),
                      SizedBox(height: 10),
                      Text("Don't have an account?"),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 244, 195),
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Signup.id);
                        },
                        child: Text("Sign up"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
