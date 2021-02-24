import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_login/provider/login_provider.dart';
import 'package:provider/provider.dart';


class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 15,
      padding: EdgeInsets.all(4),
      child: SignInButton(
        Buttons.GoogleDark,
        text: "Sign In with Google",
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 10,
        onPressed: () {
          final provider =
          Provider.of<LoginProvider>(context, listen: false);
          provider.login();
        },
      ));
}