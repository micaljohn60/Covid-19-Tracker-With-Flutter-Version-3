import 'package:covid_19_tracker/modals/prevention.dart';
import 'package:covid_19_tracker/screens/preventions_lists.dart';
import 'package:covid_19_tracker/services/dbservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Preventions extends StatefulWidget {
  
  @override
  _PreventionsState createState() => _PreventionsState();
}

class _PreventionsState extends State<Preventions> {
  @override
  Widget build(BuildContext context) {
    

    return StreamProvider<List<Prevention>>.value(
      value: DatabaseService().preventionlists,        
          initialData: [],
          child: Scaffold(
            backgroundColor: Color(0XFFefedf2),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('Preventions',style: TextStyle(color: Colors.black),),
          elevation: 0,
        ),
        body:  Prevention_lists()
        ,
      ),
    );
  }
}
