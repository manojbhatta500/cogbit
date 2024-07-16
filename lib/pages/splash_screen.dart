import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    Future.delayed(const Duration(seconds: 1)).then((value) =>
       Navigator.pushReplacementNamed(context, '/login_email')
       );
    super.initState();
  }


 @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.1* height,
                ),
                Text(
                  'Cogbit',
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                      height: 0.4 * height,
                      child: Image.asset('assets/logo.png'),
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
                  child: Text(
                    "A place for managing your tasks efficiently.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      color: CustomColors.greenColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
               
                Spacer(),
                // GestureDetector(
                //     onTap: () {
      
                //       Navigator.pushReplacementNamed(context, '/login_email');
                    
                //     },
                //     child: CustomButton(title: "Get Started",))
              ],
            ),
          ),
        ),
      ),
    );
  }
}