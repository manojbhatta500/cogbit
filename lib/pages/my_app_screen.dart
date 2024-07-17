import 'package:cogbit/blocs/get_all_module/get_all_module_bloc.dart';
import 'package:cogbit/blocs/my_app/my_app_bloc.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/utils/size.dart';
import 'package:cogbit/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen>
    with SingleTickerProviderStateMixin {
  String dropdownValue = 'All';
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

    BlocProvider.of<GetAllModuleBloc>(context).add(GetAllModule());
    BlocProvider.of<MyAppBloc>(context).add(GetMyAppList());
  }

  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.screenWidth!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<GetAllModuleBloc>(context).add(GetAllModule());
                  BlocProvider.of<MyAppBloc>(context).add(GetMyAppList());
                },
                child: Image.asset(
                  'assets/logo.png',
                  height: 50,
                ),
              ),
              ScaleTransition(
                scale: _animation,
                child: Text(
                  'My App',
                  style: GoogleFonts.crimsonPro(
                    color: CustomColors.purpleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      BlocBuilder<GetAllModuleBloc, GetAllModuleState>(
                        builder: (context, state) {
                          if (state is GetAllModuleSuccess) {
                            List<String> moduleNames = ['All'];
                            moduleNames.addAll(state.data.list.map((module) => module.name).toList());

                            return DropdownButtonFormField<String>(
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
                                  vertical: 15,
                                  horizontal: 15,
                                ),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  BlocProvider.of<MyAppBloc>(context).add(GetMyAppList());
                                });
                              },
                              items: moduleNames.map<DropdownMenuItem<String>>((String value) {
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
                            );
                          } else if (state is GetAllModuleLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is GetAllModuleFailed) {
                            return Center(child: Text('Failed to load modules.'));
                          } else {
                            return Center(child: Text('Unexpected state.'));
                          }
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 0.8 * width,
                  child: Divider(),
                ),
                BlocBuilder<MyAppBloc, MyAppState>(
                  builder: (context, state) {
                    if (state is MyAppSuccess) {
                      var filteredList = dropdownValue == 'All'
                          ? state.data.list
                          : state.data.list.where((module) => module.moduleName == dropdownValue).toList();

                      if (filteredList.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Sorry, no data available.',
                              style: GoogleFonts.crimsonPro(
                                fontSize: 16,
                                color: CustomColors.purpleColor,
                              ),
                            ),
                          ),
                        );
                      }

                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
                        height: 1000,
                        child: ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final module = filteredList[index];
                            return AppContainer(data: module);
                          },
                        ),
                      );
                    } else if (state is MyAppLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is MyAppFailed) {
                      return Center(child: Text('Failed to load modules.'));
                    } else {
                      return Center(child: Text('Unexpected state.'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
