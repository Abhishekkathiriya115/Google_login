

import 'package:flutter/material.dart';
import 'package:google_login/page/Home_page.dart';
import 'package:google_login/page/emaillogin_page.dart';
import 'package:google_login/page/registration_page.dart';
import 'package:google_login/provider/login_provider.dart';
import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

class EmailLoginPage extends StatefulWidget {
  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/Login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "email cannot be empty";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                        child: Text("Login"),
                        style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _Login(email.text, pass.text, context);
                          }
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegistrationPage()));
        },
        child: RichText(
            text: TextSpan(
              text: 'New User?',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: ' Register Now',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0XFF4321F5)),
                ),
              ],
            )).pLTRB(20, 0, 0, 15),
      ),
    );
  }

  void _Login(String email, String password, BuildContext context) async {
    LoginProvider _providerState =
    Provider.of<LoginProvider>(context, listen: false);
    try {
      if (await _providerState.LoginUser(email, password)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      Text(e);
    }
  }
}
