import 'dart:developer';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:cogbit/widgets/custom_button.dart';
import 'package:cogbit/widgets/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _setPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _setPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenHeight!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: CustomColors.purpleColor),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.1 * height,
                child: Image.asset('assets/logo.png'),
              ),
              Center(
                child: Text(
                  'Set Password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              Center(
                child: Text(
                  "Please type something you'll remember",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(
                height: 0.08 * height,
              ),
              PasswordForm(
                hintText: 'Password',
                controller: _setPasswordController,
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
              PasswordForm(
                hintText: 'Confirm Password',
                controller: _confirmPasswordController,
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
              GestureDetector(
                onTap: () {
                  log('Set Password: ${_setPasswordController.text}');
                  log('Confirm Password: ${_confirmPasswordController.text}');
                },
                child: CustomButton(title: 'Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
