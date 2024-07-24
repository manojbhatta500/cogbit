import 'package:cogbit/blocs/all_data_heading/get_all_data_heading_bloc.dart';
import 'package:cogbit/models/all_data_heading_model.dart';
import 'package:cogbit/models/my_apps_list_model.dart';
import 'package:cogbit/utils/custom_colors.dart';
import 'package:cogbit/widgets/one_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDataScreen extends StatefulWidget {
  final Module data;

  const AllDataScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<AllDataScreen> createState() => _AllDataScreenState();
}

class _AllDataScreenState extends State<AllDataScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllDataHeadingBloc>(context).add(GetAllDataHeading(id: int.parse(widget.data.id)));
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<GetAllDataHeadingBloc, GetAllDataHeadingState>(
        builder: (context, state) {
          if (state is GetAllDataHeadingLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetAllDataHeadingFailed) {
            return Center(child: Text('Failed to load data'));
          } else if (state is GetAllDataHeadingSuccess) {
            final allData = state.data;
           return ListView.builder(
  itemCount: allData.items.length,
  itemBuilder: (context, index) {
    List<Item> titles = allData.items;
    return OneDataWidget(
      titles: titles,
      onAction1: () {
        // Define your action for the first button here
      },
      onAction2: () {
        // Define your action for the second button here
      },
    );
  },
);


          } else {
            return Center(child: Text('Please wait...'));
          }
        },
      ),
    );
  }
}
