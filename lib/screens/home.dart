import 'package:covid_19_tracker/core/consts.dart';
import 'package:covid_19_tracker/services/dbservice.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  bool loading = true;
  final DatabaseService db = DatabaseService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                padding: EdgeInsets.only(top: 25, bottom: 30),
                child: Stack(
                  children: [
                    Image.asset('assets/images/virus2.png'),
                    _buildHeader(data['location'] ??= 'error')
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Container(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: DefaultTextStyle(
                                    style: TextStyle(color: Colors.grey),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Recovered',
                                          style: TextStyle(
                                              color: Colors.greenAccent[400],
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: -0.5),
                                        ),
                                        Text(
                                          data['recovered'] ?? 'error',
                                          style: TextStyle(
                                              color: Colors.greenAccent[400],
                                              fontSize: 30),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: DefaultTextStyle(
                                style: TextStyle(color: Colors.grey),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Death',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -0.5),
                                    ),
                                    Text(
                                      data['death'] ?? 'error',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 30),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 110,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DefaultTextStyle(
                      style: TextStyle(color: Colors.grey),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active',
                            style: TextStyle(
                                color: Colors.yellow[800],
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5),
                          ),
                          Text(
                            data['active'] ?? 'error',
                            style: TextStyle(
                                color: Colors.yellow[800], fontSize: 40),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 15),
                child: Text(
                  'Symptoms',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 138,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16),
                  physics: BouncingScrollPhysics(),
                  children: [
                    _buildSymptoms("assets/images/1.png", "Fever"),
                    _buildSymptoms("assets/images/2.png", "Dry Cough"),
                    _buildSymptoms("assets/images/3.png", "Headache"),
                    _buildSymptoms("assets/images/4.png", "Breathless"),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  Icons.location_on,
                  size: 40,
                  color: Color(0XFF8d12fe),
                ),
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, '/loading1');
                }),
            IconButton(
                icon: Icon(
                  Icons.clean_hands,
                  size: 40,
                  color: Color(0XFF8d12fe),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/preventions',
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String country) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 40, left: 16),
            child: Text(
              'Corona Virus $country Cases',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            )),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            data['active'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            data['error'],
            style: TextStyle(
              color: Colors.red,
              
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSymptoms(String path, String text) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
                colors: [AppColor.backgroundcolor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 3)
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(path),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
