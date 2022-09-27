
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_auth/page/share_page.dart';
import 'package:responsive_auth/page/workflow_page.dart';
//import 'package:responsive_auth/screens/insert_data.dart';
import '../main.dart';

// ignore: must_be_immutable
class ViewGrantsPage extends StatefulWidget {
  
  // ViewGrantsPage({Key? key, required String title}) : super(key: key) {
  //   data = _reference.snapshots();
  // }

  late Stream<QuerySnapshot> data;

  ViewGrantsPage({Key? key}) : super(key: key);

  @override
  State<ViewGrantsPage> createState() => _ViewGrantsPageState();
}

class _ViewGrantsPageState extends State<ViewGrantsPage> {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('data').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Good Day Client...'),
          backgroundColor: Colors.blue,
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme().apply(bodyColor: Colors.white),
              ),
              child: PopupMenuButton<int>(
                color: Colors.blueGrey,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text('Main Page'),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Share'),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.logout),
                        SizedBox(width: 5),
                        Text('Sign Out'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]
          ),
      body: StreamBuilder<QuerySnapshot > (
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
    ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewGrantsPage()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WorkFlow()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserInformationState extends State<ViewGrantsPage> {
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

onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SharePage()),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MyApp()),
          (route) => false,
        );
    }
  }