import 'package:denver_test_3/topics/topic_item.dart';

import 'about/about.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'profile/profile.dart';
import 'topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
