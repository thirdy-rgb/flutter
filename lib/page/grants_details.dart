import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class ItemDetails extends StatelessWidget {
  late DocumentReference _documentReference;
  late Future<DocumentSnapshot> _futureDocument;

  ItemDetails(String id, {Key? key}) : super(key: key) {
    _documentReference =
        FirebaseFirestore.instance.collection('data').doc(id);
    _futureDocument = _documentReference.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('assistance details'),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: _futureDocument,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            if (snapshot.hasData) {
              DocumentSnapshot documentSnapshot = snapshot.data;
              Map<String, dynamic> mapData =
                  documentSnapshot.data() as Map<String, dynamic>;

              return Column(
                children: [
                  Text(mapData['Agency Name']),
                  Text(mapData['Project Name']),
                  Text(mapData['Description'])
                
                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
