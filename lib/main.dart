import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polling/firebase_options.dart';
import 'package:polling/providers/authentication_provider.dart';
import 'package:polling/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context)=>AuthProvider())
     ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}

