import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_portal/screens/common/custom_app_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: CustomAppBar("Home"),
        body: Text("hi")
      ),
    );
  }
}

// BlocProvider(
// create: (context) => EventBloc()..add(FetchAllEvents()),
// child:   ActiveEventsPage(),
// ),
// BlocProvider(
// create: (context) => AmbulanceBloc()..add(FetchAmbulances()),
// child:   AssignDriversPage(),
// ),