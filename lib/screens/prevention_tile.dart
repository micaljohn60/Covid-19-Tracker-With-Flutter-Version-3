import 'package:covid_19_tracker/modals/prevention.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Prevention_Tile extends StatelessWidget {
  final Prevention prevent;
  Prevention_Tile({this.prevent});

  @override
  Widget build(BuildContext context) {
    String id = prevent.id.toString();
    String url = prevent.image;

    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Container(
        height: 460,
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(id + ' . ' + prevent.title,style: TextStyle(fontSize: 18),),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.png',
                      image: url,
                      ) ,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10,top:3,right: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        prevent.detail,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
