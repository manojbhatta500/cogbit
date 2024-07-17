import 'package:cogbit/blocs/email_login/email_login_bloc.dart';
import 'package:cogbit/blocs/get_all_module/get_all_module_bloc.dart';
import 'package:cogbit/blocs/my_app/my_app_bloc.dart';
import 'package:cogbit/pages/login_email.dart';
import 'package:cogbit/pages/login_mobile.dart';
import 'package:cogbit/pages/otp_screen.dart';
import 'package:cogbit/pages/password_screen.dart';
import 'package:cogbit/pages/splash_screen.dart';
import 'package:cogbit/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig here
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmailLoginBloc(),
        ),
        BlocProvider(
          create: (context) => GetAllModuleBloc(),
        ),
         BlocProvider(
          create: (context) => MyAppBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => SplashScreen(),
          '/login_email': (context) => const LoginEmailScreen(),
          '/login_phone': (context) => const LoginMobileScreen(),
          '/otp_screen': (context) => const OtpScreen(),
          '/password_screen': (context) => const PasswordScreen(),
        },
      ),
    );
  }
}
