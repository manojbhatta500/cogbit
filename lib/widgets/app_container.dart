import 'package:cogbit/models/my_apps_list_model.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppContainer extends StatefulWidget {
   AppContainer({super.key, required this.data});
  final Module data;
  // final String heading;
  // final String detail;

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Container(
      width: 0.8 * width,
      height: 0.2 * height,
      margin: EdgeInsets.symmetric(vertical: 0.01 * height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 0.06 * height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomColors.purpleColor.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.data.moduleName,
                  style: GoogleFonts.crimsonPro(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 0.06 * height,
            width: double.infinity,
            child: Center(
              child: Text(
                widget.data.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.crimsonPro(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.purpleColor,
                ),
              ),
            ),
          ),
          Divider(),
          Text(
            'Start',
            textAlign: TextAlign.center,
            style: GoogleFonts.crimsonPro(
              fontSize: 20,
              color: CustomColors.purpleColor,
            ),
          ),
        ],
      ),
    );
  }
}
