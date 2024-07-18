import 'package:cogbit/models/my_apps_list_model.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDataScreen extends StatelessWidget {
  final Module data;

  const AllDataScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = int.tryParse(data.id) ?? 0; // Default to 0 if parsing fails

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
               Image.asset(
                  'assets/logo.png',
                  height: 40,
                ),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
             
                const SizedBox(width: 10),
                Text(
                  getTitleForId(id),
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: id == 1
                ? DepartmentDetailsWidget()
                : id == 5
                    ? EmployeeDetailsWidget()
                    : Center(child: Text('Invalid ID')),
          ),
        ],
      ),
    );
  }

  String getTitleForId(int id) {
    switch (id) {
      case 1:
        return 'Department Details';
      case 5:
        return 'Employee Details';
      default:
        return 'All Data';
    }
  }
}

// department detail widger 


class DepartmentDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Department Name',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Department Code',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Actions',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// employee detail widget

class EmployeeDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Employee Name',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Employee ID',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Actions',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
