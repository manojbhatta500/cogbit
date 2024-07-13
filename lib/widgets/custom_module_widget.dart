import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomModuleWidget extends StatefulWidget {
  final String id;
  final String module;
  final String app;
  final String details;
  final String status;
  final VoidCallback onEdit;
  final VoidCallback onApprove;

  const CustomModuleWidget({
    required this.id,
    required this.module,
    required this.app,
    required this.details,
    required this.status,
    required this.onEdit,
    required this.onApprove,
  });

  @override
  State<CustomModuleWidget> createState() => _CustomModuleWidgetState();
}

class _CustomModuleWidgetState extends State<CustomModuleWidget>
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenWidth!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Module: ${widget.module}',
                          style: GoogleFonts.crimsonPro(
                            fontSize: 18,
                            color: CustomColors.purpleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ID: ${widget.id}',
                          style: GoogleFonts.crimsonPro(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    Text(
                      'App: ${widget.app}',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 16,
                        color: CustomColors.purpleColor,
                      ),
                    ),
                    Divider(),
                    Text(
                      'Details: ${widget.details}',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 16,
                        color: CustomColors.purpleColor,
                      ),
                    ),
                    Divider(),
                    Text(
                      'Status: ${widget.status}',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 16,
                        color: CustomColors.purpleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: ElevatedButton(
                  onPressed: widget.onEdit,
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ScaleTransition(
                scale: _animation,
                child: ElevatedButton(
                  onPressed: widget.onApprove,
                  child: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
