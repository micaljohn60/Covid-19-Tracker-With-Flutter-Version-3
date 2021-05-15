import 'package:covid_19_tracker/modals/prevention.dart';
import 'package:covid_19_tracker/screens/prevention_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Prevention_lists extends StatefulWidget {
  @override
  _Prevention_listsState createState() => _Prevention_listsState();
}

// ignore: camel_case_types
class _Prevention_listsState extends State<Prevention_lists> {
  @override
  Widget build(BuildContext context) {

    final prevent = Provider.of<List<Prevention>>(context) ?? [];

    return Container(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(prevent.length, (index) => Prevention_Tile(prevent: prevent[index],)).toList()
              )
            ),
          
        ],
      ),
    );

  }
}