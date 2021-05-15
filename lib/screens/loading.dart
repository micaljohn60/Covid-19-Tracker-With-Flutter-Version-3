import 'package:covid_19_tracker/services/covid19api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpGlobal() async{   

    Covid instance = Covid();
    await instance.getGlobal();

  setState(() {  
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : 'Global' ,
      'death' : instance.death.toString(),
      'recovered' : instance.recovered.toString(),
      'active' : instance.active.toString(),   
      'error' : instance.error.toString()   
    });
    
  });    

  }  

  @override
  void initState() {
    super.initState();
    setUpGlobal();   
    
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
      Text('Covid 19 Tracker by HI.net',style: TextStyle(color: Colors.white,fontSize: 20),),
      SizedBox(
        height: 30,
      ),
      Text('Loading...',style: TextStyle(color: Colors.white,fontSize: 15),)
        ],
      ) ,
      )
      
    );
  }
}