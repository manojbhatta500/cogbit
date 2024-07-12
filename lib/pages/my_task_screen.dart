import 'package:cogbit/widgets/custom_banner.dart';
import 'package:flutter/material.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomBanner(
                title: 'My Tasks',
              )
            ],
          ),
        ),
      ),
    );
  }
}
