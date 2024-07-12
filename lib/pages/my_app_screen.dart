import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:cogbit/widgets/custom_banner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  String dropdownValue = 'All';

  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.screenWidth!;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 10),
              const CustomBanner(title: 'My Apps'),
              const SizedBox(height: 20),
              Container(
                width: 0.8 * width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.crimsonPro(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    isDense: true,
                  ),
                  style: GoogleFonts.crimsonPro(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),

              Container(
                width: 0.8 * width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Module*', // Replace with your desired title
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: CustomColors.purpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['All', 'HR', 'Purchase']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.crimsonPro(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              // Add more widgets here as needed
            ],
          ),
        ),
      ),
    );
  }
}
