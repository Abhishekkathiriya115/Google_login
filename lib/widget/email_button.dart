import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_login/page/registration_page.dart';

class EmailButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 15,
      padding: EdgeInsets.all(4),
      child: SignInButton(
        Buttons.Email,
        text: 'Sign In With Email',
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 10,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationPage()));
        },
      ));
}
