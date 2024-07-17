import 'package:cogbit/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDataScreen extends StatelessWidget {
  const AllDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
            ),
            SizedBox(width: 10), // Add some spacing between the logo and title
            Text(
              'All Data',
              style: GoogleFonts.crimsonPro(
                color: CustomColors.purpleColor,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 0.8 * width,
            child: Table(
              columnWidths: const {
                1: FlexColumnWidth(2),
                0: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    Center(
                      child: Text(
                        'Department Name',
                        style: GoogleFonts.crimsonPro(
                          fontSize: 14,
                          color: CustomColors.purpleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Department Code',
                        style: GoogleFonts.crimsonPro(
                          fontSize: 14,
                          color: CustomColors.purpleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Action',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: CustomColors.purpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
              itemCount: 10, // Replace with the actual item count
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Department $index',
                          style: GoogleFonts.crimsonPro(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Code #$index',
                          style: GoogleFonts.crimsonPro(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: CustomColors.purpleColor,
                          ),
                          onPressed: () {
                            // Add your edit action here
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
