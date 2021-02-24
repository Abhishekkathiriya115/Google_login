import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_login/provider/login_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    LoginProvider _providerState =
        Provider.of<LoginProvider>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Logged In',
          //   style: TextStyle(color: Colors.white),
          // ),
          // SizedBox(height: 8),
          // // CircleAvatar(
          // //   maxRadius: 25,
          // //   backgroundImage: NetworkImage(user.photoURL),
          // // ),
          // SizedBox(height: 8),
          // Text(
          //   'Name: ' + user.displayName,
          //   style: TextStyle(color: Colors.white),
          // ),
          // SizedBox(height: 8),
          // Text(
          //   'Email: ' + user.email,
          //   style: TextStyle(color: Colors.white),
          // )
          SizedBox(height: 8),
          // Text("UID: ${_providerState.uid}"),
          // Text("Email : ${_providerState.email}"),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<LoginProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
