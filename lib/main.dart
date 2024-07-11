import 'package:cogbit/pages/login_email.dart';
import 'package:cogbit/pages/login_mobile.dart';
import 'package:cogbit/pages/otp_screen.dart';
import 'package:cogbit/pages/password_screen.dart';
import 'package:cogbit/utils/size.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SizeConfig().init(context); // Initialize SizeConfig here
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/login_email',
          routes: {
            '/login_email': (context) => const LoginEmailScreen(),
            '/login_phone': (context) => const LoginMobileScreen(),
            '/otp_screen': (context) => const OtpScreen(),
            '/password_screen': (context) => const PasswordScreen(),
          },
        );
      },
    );
  }
}
