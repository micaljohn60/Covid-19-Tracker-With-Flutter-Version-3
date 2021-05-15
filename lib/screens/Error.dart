import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF8d12fe),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text('Something Wrong! ',style: TextStyle(color: Colors.white,fontSize: 20),)),
              Container(child: Icon(Icons.wifi_off,color: Colors.white,size: 30,)),
              Container(
                child: IconButton(onPressed: (){SystemNavigator.pop();}, icon: Icon(Icons.exit_to_app,color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}