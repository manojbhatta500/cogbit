import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:cogbit/widgets/custom_button.dart';
import 'package:cogbit/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMobileScreen extends StatefulWidget {
  const LoginMobileScreen({super.key});

  @override
  State<LoginMobileScreen> createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  TextEditingController phoneNumber = TextEditingController();
  // bool _isChecked = false;

  @override
  void dispose() {
    phoneNumber.dispose();
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
                    "With PhoneNumber",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.purpleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.05 * height,
                ),
                Center(
                  child: Text(
                    "We will send you 5 digit verification code",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.purpleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.1 * height,
                ),
                CustomTextFormField(
                  hintText: 'PhoneNumber',
                  controller: phoneNumber,
                  prefixIcon: SizedBox(
                    // child: SvgPicture.asset(
                    //   'assets/mess.svg',
                    //   width: 15,
                    //   height: 15,
                    // ),
                    child: Icon(
                      Icons.phone,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.1 * height,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/otp_screen');
                    },
                    child: CustomButton(title: 'Continue')),
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
                    Navigator.pushReplacementNamed(context, '/login_email');
                  },
                  child: Text(
                    "Login with  Email",
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
