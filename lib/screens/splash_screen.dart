import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polling/screens/Authentication/auth_page.dart';
import 'package:polling/screens/main_activity.dart';
import 'package:polling/utils/router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  void navigate()
  {
    Future.delayed( const Duration(seconds: 3),(){
      if(user == null)
        {
          nextPageOnly(context,const AuthPage());
        }
      else{
        nextPageOnly(context, MainActivityPage());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
