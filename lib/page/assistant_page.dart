//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:responsive_auth/page/settings_page.dart';
import 'package:responsive_auth/page/update_page.dart';
import 'package:responsive_auth/page/workflow_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main1.dart';

// ignore: must_be_immutable
class AssistantPage extends StatelessWidget {
 // late DocumentReference _documentReference;
  // Future<DocumentSnapshot> _futureDocument;
  const AssistantPage({Key? key})
      : super(
            key:
                key); /*{

                  class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

    _documentReference =
        FirebaseFirestore.instance.collection('persons').doc(id);
    _futureDocument = _documentReference.get();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistant'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<DocumentSnapshot>(
     //   future: _futureDocument,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            DocumentSnapshot documentSnapshot = snapshot.data;
            Map<String, dynamic> mapData =
                documentSnapshot.data() as Map<String, dynamic>;

            return Column(
              children: [
                Text(mapData['name']),
                Text(mapData['age']),
                Text(mapData['idnumber']),
                Text(mapData['location'])
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WorkFlow()));
              },
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdatePage()));
              },
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.settings,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const SettingsPage()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
