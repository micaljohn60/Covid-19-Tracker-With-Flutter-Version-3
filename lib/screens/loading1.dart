import 'package:covid_19_tracker/services/covid19api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading1 extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading1> {
  void setUpCountries() async {
    Covid instance = Covid();
    await instance.getCountries();
    setState(() {
      Navigator.pushReplacementNamed(context, '/countries', arguments: {
        'location': instance.location ?? 'error',
        'error': instance.error
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setUpCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF8d12fe),
        body: Padding(
          padding: EdgeInsets.only(top: 300),
          child: Column(
            children: [
              SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Loading Countries',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ));
  }
}
