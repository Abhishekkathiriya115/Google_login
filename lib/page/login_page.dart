import 'package:flutter/material.dart';
import 'package:google_login/widget/BackgroundPainter.dart';
import 'package:google_login/widget/email_button.dart';
import 'package:google_login/widget/google_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
       fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 175,
                  child: Text(
                    'Welcome Back To MyApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              GoogleSignupButtonWidget(),
              SizedBox(height: 12),
              EmailButtonWidget(),
              SizedBox(height: 12),
              Text(
                'Login to continue',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
            ],
          ),
        ],
      );
}
