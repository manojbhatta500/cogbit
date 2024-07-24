import 'package:cogbit/models/all_data_heading_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';

class OneDataWidget extends StatelessWidget {
  final List<Item> titles;
  final VoidCallback onAction1;
  final VoidCallback onAction2;

  const OneDataWidget({
    Key? key,
    required this.titles,
    required this.onAction1,
    required this.onAction2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Container(
      width: 0.9 * width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display titles dynamically with dividers between them
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: titles.asMap().entries.map((entry) {
              int index = entry.key;
              Item title = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      title.d,
                      style: GoogleFonts.crimsonPro(
                        fontSize: 16,
                        color: CustomColors.purpleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (index < titles.length - 1) 
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 1,
                    ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 12), // Space between titles and actions
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: CustomColors.purpleColor, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                onPressed: onAction1,
                child: Text('Edit', style: TextStyle(fontSize: 14)),
              ),
              SizedBox(width: 8), // Space between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                onPressed: onAction2,
                child: Text('View', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
