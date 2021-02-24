import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_login/widget/logic_routs.dart';
import 'package:google_login/provider/login_provider.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MultiProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.deepOrange,
            ),
          home: LogicRouts(),
          ),
          providers: [
            ChangeNotifierProvider(create: (_) => LoginProvider()),
          ]);
}
