import 'package:flutter/material.dart';
import 'package:techub/screens/Welcomescreen.dart';
import 'package:techub/screens/login_screen.dart';
import 'package:techub/widgets/signinsuccess.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key});
  static const id = 'Signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email;
  String? password;
  String? username;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();
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
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _username,
                        onChanged: (value) {
                          username = value;
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
                        controller: _email,
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Email",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _password,
                        obscureText: !isPasswordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Create new Password",
                          prefixIcon: Icon(Icons.password_outlined),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _confirm,
                        obscureText: !isConfirmPasswordVisible,
                        onChanged: (value) {
                          password = value;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(Icons.password_outlined),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Confirm Password",
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 244, 195),
                          onPrimary: Colors.black,
                        ),
                        onPressed: () async {
                          try {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Sign-up Successful"),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => welcome(),
                              ),
                              (route) => false,
                            );
                            setState(() {
                              _username.clear();
                              _email.clear();
                              _password.clear();
                              _confirm.clear();
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text('SignUp'),
                      ),
                      SizedBox(height: 10),
                      Text("Already have an account"),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 244, 195),
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: Text("Log-In"),
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
