import 'dart:developer';

import 'package:cogbit/blocs/bloc/email_login_bloc.dart';
import 'package:cogbit/pages/bottom_bar.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:cogbit/widgets/custom_button.dart';
import 'package:cogbit/widgets/custom_text_form_feild.dart';
import 'package:cogbit/widgets/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure the correct import
import 'package:google_fonts/google_fonts.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenHeight!;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.1 * height,
                  child: Image.asset('assets/logo.png'),
                ),
                Center(
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.purpleColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "With Email",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.purpleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.1 * height,
                ),
                CustomTextFormField(
                  hintText: 'E-mail ID',
                  controller: emailController,
                  prefixIcon: SizedBox(
                    child: SvgPicture.asset(
                      'assets/mess.svg',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
                PasswordForm(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureIcon: SvgPicture.asset(
                    'assets/lock.svg',
                    width: 15,
                    height: 15,
                  ),
                  revealIcon: Icon(
                    Icons.visibility,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 0.1 * height,
                ),
                BlocConsumer<EmailLoginBloc, EmailLoginState>(
                  listener: (context, state) {
                    if (state is EmailLoginLoading) {
                      log('this is login email screen email loading bloc');
                    } else if (state is EmailLoginFailed) {
                      log('this is login email screen email failed bloc');
                      showInvalidCredentialsDialog(context);
                    } else if (state is EmailLoginSuccess) {
                      log('this is login email screen email success bloc');
                      showLoginSuccessDialog(context, state.data.name!);
                    } else {
                      log('this is login email screen email else bloc');
                    }
                  },
                  builder: (context, state) {
                    if (state is EmailLoginLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GestureDetector(
                          onTap: () {
                            BlocProvider.of<EmailLoginBloc>(context).add(
                                EmailLogin(
                                    loginId: emailController.text,
                                    password: passwordController.text));
                          },
                          child: CustomButton(title: 'Login'));
                    }
                  },
                ),
                SizedBox(
                  height: 0.02 * height,
                ),
                Center(
                  child: Text(
                    "-- or --",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.greenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * height,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login_phone');
                  },
                  child: Text(
                    "Login with Phone Number?",
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.greenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showLoginSuccessDialog(BuildContext context, String username) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Center(
          child: Text(
            "Login Successful",
            style: GoogleFonts.crimsonPro(
              color: CustomColors.purpleColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: CustomColors.greenColor,
              size: 50,
            ),
            SizedBox(height: 20),
            Text(
              "You have successfully logged in as ${username}.",
              textAlign: TextAlign.center,
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomBar()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.purpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "OK",
                style: GoogleFonts.crimsonPro(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void showInvalidCredentialsDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Center(
          child: Text(
            "Invalid Credentials",
            style: GoogleFonts.crimsonPro(
              color: CustomColors.purpleColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50,
            ),
            SizedBox(height: 20),
            Text(
              "The email or password you entered is incorrect. Please try again.",
              textAlign: TextAlign.center,
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.purpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "OK",
                style: GoogleFonts.crimsonPro(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
