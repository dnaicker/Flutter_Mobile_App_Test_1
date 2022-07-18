import 'package:flutter/material.dart';
import '../login/login.dart';
import '../services/auth.dart';
import '../shared/bottom_nav.dart';
import '../topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
              // child: ErrorMessage(),
              );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
