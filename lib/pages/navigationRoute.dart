import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:handbook/pages/profilePage.dart';
import 'package:handbook/pages/verificationPage.dart';

class navigationRoute extends StatefulWidget {
  const navigationRoute({super.key});

  @override
  State<navigationRoute> createState() => _navigationRouteState();
}

class _navigationRouteState extends State<navigationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //If the StreamBuilder has data or if the user is logged in then  route him to HomePage else route him to LoginPage
          if (snapshot.hasData) {
            return const ProfilePage();
          } else {
            return const VerificationPage();
          }
        },
      ),
    );
  }
}
