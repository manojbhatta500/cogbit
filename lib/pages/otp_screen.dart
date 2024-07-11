import 'dart:developer';

import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:cogbit/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenHeight!;
    double screenWidth = SizeConfig.screenWidth!;
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
                  'OTP Verification',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 0.05 * height,
              ),
              Center(
                child: Text(
                  "We will send you a 5 digit verification code",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "to +977 9813790435",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.2 * screenWidth),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor:
                        CustomColors.lightPurpleColor, // Adjust this color
                    activeColor: CustomColors.purpleColorlight,
                    inactiveColor: CustomColors.purpleColorlight,
                    selectedColor: CustomColors.purpleColorlight,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: _pinCodeController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _pinCodeController.text = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
              SizedBox(
                height: 0.1 * height,
              ),
              GestureDetector(
                  onTap: () {
                    log('the current otp is ${_pinCodeController.text}');

                    Navigator.pushNamed(context, '/password_screen');
                  },
                  child: CustomButton(title: 'Confirm')),
              SizedBox(
                height: 0.02 * height,
              ),
              Center(
                child: Text(
                  "Didn't received OTP? Resend",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
