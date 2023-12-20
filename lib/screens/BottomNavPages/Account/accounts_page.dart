import 'package:flutter/material.dart';
import 'package:polling/Styles/colors.dart';
import 'package:polling/Utils/router.dart';
import 'package:polling/providers/authentication_provider.dart';
import 'package:polling/screens/Authentication/auth_page.dart';
import 'package:polling/screens/main_activity.dart';
import 'package:polling/utils/message.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthProvider().logOut().then((value) {
              if (value == false) {
                error(context, message: "Please try again");
              } else {
                nextPageOnly(context, const AuthPage());
              }
            });
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: const Text("Log Out"),
          ),
        ),
      ),
    );
  }
}
