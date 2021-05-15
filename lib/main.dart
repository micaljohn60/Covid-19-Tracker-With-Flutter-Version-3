import 'package:covid_19_tracker/screens/countries.dart';
import 'package:covid_19_tracker/screens/home.dart';
import 'package:covid_19_tracker/screens/loading.dart';
import 'package:covid_19_tracker/screens/loading1.dart';
import 'package:covid_19_tracker/screens/preventions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/loading1': (context) => Loading1(),
      '/home' :(context) => Home(),
      '/countries' : (context) => Countries(),
      '/preventions' : (context) => Preventions()

    },
  ));
}

