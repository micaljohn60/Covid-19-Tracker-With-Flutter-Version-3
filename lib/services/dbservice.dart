import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracker/modals/prevention.dart';

class DatabaseService{
  final CollectionReference collection = FirebaseFirestore.instance.collection('preventions');

  List<Prevention> _preventionlists(QuerySnapshot snapshot){
    return snapshot.docs.map((docs){
      return Prevention(
        id: docs.data()['id'] ?? 0,
        detail: docs.data()['description'] ?? 'Error',
        title: docs.data()['title'] ?? 'Error',
        image: docs.data()['image'] ?? 'Error'
      );
    }).toList();
  }

  Stream<List<Prevention>> get preventionlists{
    return collection.snapshots().map(_preventionlists);
  } 
}