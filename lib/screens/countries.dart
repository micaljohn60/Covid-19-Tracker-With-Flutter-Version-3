import 'package:covid_19_tracker/screens/Error.dart';
import 'package:covid_19_tracker/services/covid19api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  void global() async {
    Covid instance = Covid();
    await instance.getGlobal();

    setState(() {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': 'Global',
        'death': instance.death.toString(),
        'recovered': instance.recovered.toString(),
        'active': instance.active.toString(),
        'error' : instance.error.toString()
      });
    });
  }

  void showToast(){
    Fluttertoast.showToast(
      msg: "Loading Please Wait",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
    }

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String text = 'Countries';

    return data['location'] == 'error'
        ? Error()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.public, color: Colors.black),
                  onPressed: () {                    
                    showToast();
                    global();                    
                  }),
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
            ),
            backgroundColor: Color(0XFFefedf2),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 190,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Image.network(
                          'https://www.countryflags.io/' + data['location'][index]['CountryCode'] + '/flat/64.png'),
                          title: Text(data['location'][index]['Country']),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/home',
                                arguments: {
                                  'location': data['location'][index]['Country'],
                                  'death': data['location'][index]['TotalDeaths'].toString(),
                                  'recovered': data['location'][index]['TotalRecovered'].toString(),
                                  'active': data['location'][index]['TotalConfirmed'].toString(),
                                  'error' : data['error'].toString()
                                });
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
  }
}
