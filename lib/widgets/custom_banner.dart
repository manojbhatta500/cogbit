import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBanner extends StatefulWidget {
  const CustomBanner({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CustomBannerState createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.screenWidth!;

    return Center(
      child: Container(
        width: 0.9 * width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        height: 110,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              // Lottie.asset(
              //   'assets/bot.json',
              //   height: 200,
              // ),
              Image.asset(
                'assets/logo.png',
                height: 200,
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'My Apps',
                  //   style: GoogleFonts.crimsonPro(
                  //     color: CustomColors.purpleColor,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w900,
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  ScaleTransition(
                    scale: _animation,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ChatScreen()));
                      },
                      child: Text(
                        widget.title,
                        style: GoogleFonts.crimsonPro(
                          color: CustomColors.purpleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
