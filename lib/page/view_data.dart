import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInformationState extends StatefulWidget {
  const UserInformationState({super.key});

  @override
  State<UserInformationState> createState() => _UserInformationStateState();
}

class _UserInformationStateState extends State<UserInformationState> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('data').snapshots();
  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot > (
        stream: _usersStream,
      //stream: FirebaseFirestore.instance.collection("data").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['agency']),
                  subtitle: Text(data['description name']),
                );
              })
              .toList()
              .cast(),
        );
      },     
    );
  }
}
